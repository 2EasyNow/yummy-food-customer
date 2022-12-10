import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

import '../controllers/orders_list_controller.dart';

class OrdersListView extends GetView<OrdersListController> {
  // tab view with active and past orders
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicator: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              tabs: [
                Tab(
                  text: 'Active',
                ),
                Tab(
                  text: 'Past',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _OrdersList(validStates: OrderStatus.activeStates),
                  _OrdersList(validStates: OrderStatus.endStates),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrdersList extends GetView<OrdersListController> {
  const _OrdersList({required this.validStates});
  final List<OrderStatus> validStates;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final orders = controller.orders.where((element) {
        return validStates.contains(element.status);
      }).toList();
      return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final restaurant = controller.getRestaurant(order.restaurantId);
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ORDERS_STATUS_DETAIL, arguments: {
                'order': order,
                'restaurant': restaurant,
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder<String>(
                      future: FirebaseUtils.fileUrlFromFirebaseStorage(restaurant.bannerImagePath),
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
                  Text(
                    controller.getRestaurant(orders[index].restaurantId).name,
                    style: GoogleFonts.catamaran(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.sp,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Total: ',
                              style: AppTextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rs. ${order.totalBill}',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: orders[index].status.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          orders[index].status.title,
                          style: AppTextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
