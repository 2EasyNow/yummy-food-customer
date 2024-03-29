import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/domain/rider/rider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/utils/firebase.dart';
import '../../../data/order/models/food_order.dart';
import '../controllers/orders_status_detail_controller.dart';

class OrdersStatusDetailView extends GetView<OrdersStatusDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: FutureBuilder<String>(
                  future: FirebaseUtils.fileUrlFromFirebaseStorage(controller.restaurant.bannerImagePath),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CachedNetworkImage(
                        imageUrl: snapshot.data!,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                controller.restaurant.name,
                style: GoogleFonts.catamaran(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ',
                    style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    controller.restaurant.id,
                    style: AppTextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order Status: ',
                    style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: controller.order.status.color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      controller.order.status.title,
                      style: AppTextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total Bill: ',
                    style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Rs. ${controller.order.totalBill}'),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isProductsFetched.isFalse) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.separated(
                      itemCount: controller.orderProducts.length,
                      separatorBuilder: (context, index) => const Divider(height: 20),
                      itemBuilder: (context, index) {
                        final product = controller.orderProducts[index];
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FutureBuilder<String>(
                                  future: FirebaseUtils.fileUrlFromFirebaseStorage(product.imagePath),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return CachedNetworkImage(
                                        imageUrl: snapshot.data!,
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(product.productName),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Qty: ${product.quantity}'),
                                  Text('Rs. ${product.price}'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              if (controller.order.status == OrderStatus.pickedUpByRider)
                TextButton(
                  onPressed: () {
                    // open full screen map with
                    Get.generalDialog(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return RiderLiveLocationMap();
                      },
                    );
                  },
                  child: const Text('See Rider'),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class RiderLiveLocationMap extends GetView<OrdersStatusDetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<RiderDocumentSnapshot>(
          stream: riderRef.doc(controller.order.riderId).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final rider = snapshot.data!.data!;
              return Column(
                children: [
                  Material(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Rider Name: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(rider.name),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Rider Phone: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(rider.phone),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: rider.location ?? const LatLng(0, 0),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('rider'),
                          infoWindow: InfoWindow(
                            title: rider.name,
                            snippet: rider.phone,
                          ),
                          position: rider.location ?? const LatLng(0, 0),
                        ),
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // return GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(0, 0),
            //   ),
            // );
          }),
    );
  }
}
