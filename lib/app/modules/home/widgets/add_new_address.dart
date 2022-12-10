import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';
import 'package:intelligent_food_delivery/app/modules/home/controllers/add_new_address_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget which will have a map and slide panel on top of it in which user can see the address from the map
    // and can give a noteForRider and select the label Home, Office, Other
    // and a button to add the address
    return Material(
      child: GetBuilder<AddNewAddressController>(
          init: AddNewAddressController(),
          builder: (controller) {
            if (controller.isLocationPermissionRejected != null && controller.isLocationPermissionRejected == true) {
              return const Center(
                child: Text("Location Permission Rejected. Please grant location permission to continue."),
              );
            }
            if (controller.userInitialLocation == null) {
              return Center(
                child: SpinKitCircle(
                  color: AppColors(context).primary,
                ),
              );
            }

            return Stack(
              children: [
                Positioned.fill(
                  child: SlidingUpPanel(
                    maxHeight: 50.h,
                    minHeight: 40.h,
                    controller: controller.panelController,
                    parallaxEnabled: true,
                    parallaxOffset: 0.9,
                    boxShadow: const [],
                    panelBuilder: (sc) {
                      return const _AddressPanel();
                    },
                    backdropColor: Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18.0),
                    ),
                    body: SafeArea(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: controller.userInitialLocation!,
                                zoom: 15,
                              ),
                              myLocationButtonEnabled: true,
                              zoomControlsEnabled: false,
                              myLocationEnabled: true,
                              onCameraMove: controller.onCameraMove,
                            ),
                          ),
                          // Marker in the center of the map
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: Icon(
                              Icons.location_on,
                              size: 32,
                              color: AppColors(context).primary,
                            ).paddingOnly(bottom: 32),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 8,
                    ),
                    child: TextButton(
                      onPressed: controller.isSearchingForAddress ? null : controller.onAddAddress,
                      child: const Text('Add Address'),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class _AddressPanel extends StatelessWidget {
  const _AddressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewAddressController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(18.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  height: 4,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: AppColors(context).primary,
                ),
                title: Text(
                  controller.address,
                  style: AppTextStyle(
                    fontSize: 9.sp,
                  ),
                ),
                subtitle: Text(controller.city),
              ),
              const SizedBox(height: 12),
              Text(
                'Delivery Instructions',
                style: AppTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                'Give us more information about your address',
                style: AppTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: controller.noteController,
                onTap: () {
                  controller.panelController.open();
                },
                decoration: const InputDecoration(
                  hintText: '(Optional) Note for rider',
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Label',
                style: AppTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                'Choose a label for your address',
                style: AppTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Obx(
                () {
                  return Row(
                    children: [
                      for (int i = 0; i < AddressLabel.values.length; i++) ...[
                        Radio<AddressLabel>(
                          value: AddressLabel.values[i],
                          groupValue: controller.label.value,
                          onChanged: (value) {
                            controller.label.value = value!;
                          },
                        ),
                        Text(
                          AddressLabel.values[i].name.capitalizeFirst!,
                          style: AppTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        if (i != AddressLabel.values.length - 1) const SizedBox(width: 20),
                      ],
                    ],
                  );
                },
              ),
              const Spacer(),
            ],
          ).paddingSymmetric(horizontal: 20),
        );
      },
    );
  }
}
