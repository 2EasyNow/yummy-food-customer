import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/settings.controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          if (!controller.isDataFetched) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Form to update the settings
          // Delivery costs
          // 1. min delivery cost
          // 2. cost by km\
          // search radius
          // Platform fee
          return Form(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Min Delivery Cost'),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue: controller.settings['deliveryCost']['min'].toString(),
                            onChanged: (value) {
                              controller.minDeliveryCost.value = double.tryParse(value) ?? controller.settings['deliveryCost']['min'];
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cost by KM'),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue: controller.settings['deliveryCost']['perKM'].toString(),
                            onChanged: (value) {
                              controller.costByKm.value = double.tryParse(value) ?? controller.settings['deliveryCost']['perKM'];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Platform Fee'),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue: controller.settings['platformFee'].toString(),
                            onChanged: (value) {
                              controller.costByKm.value = double.tryParse(value) ?? controller.settings['platformFee'];
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Search Radius (KM)'),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue: controller.settings['searchInKM'].toString(),
                            onChanged: (value) {
                              controller.searchRadius.value = double.tryParse(value) ?? controller.settings['searchInKM'];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: controller.updateSettings,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text('Update Settings'),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
