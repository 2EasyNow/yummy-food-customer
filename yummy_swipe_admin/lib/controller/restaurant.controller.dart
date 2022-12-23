import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/restaurant/restaurant.dart';

class RestaurantController extends GetxController {
  RestaurantDataGridSource dataSource = RestaurantDataGridSource(restaurant: []);
  bool isDataFecthed = false;
  @override
  void onInit() {
    super.onInit();
    updateDataSource();
  }

  updateDataSource() async {
    final value = await userRef.get();
    final restaurants = value.docs.map((e) => e.data).toList();
    dataSource = RestaurantDataGridSource(restaurant: restaurants);
    isDataFecthed = true;
    update();
  }
}

class RestaurantDataGridSource extends DataGridSource {
  RestaurantDataGridSource({required List<Restaurant> restaurant}) {
    _restaurants = restaurant
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'Owner Name', value: e.ownerName),
              DataGridCell<String>(columnName: 'Phone', value: e.phone),
              DataGridCell<bool>(columnName: 'active', value: e.active),
            ]))
        .toList();
  }

  List<DataGridRow> _restaurants = [];

  @override
  List<DataGridRow> get rows => _restaurants;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: dataGridCell.columnName == 'id' ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'active'
            ? TextButton(
                onPressed: () {
                  // if going to change the active status of the restaurant
                  // confirm the change
                  // if confirmed, change the status
                  // else do nothing

                  Get.defaultDialog(
                    title: 'Change Active Status',
                    middleText: 'Are you sure you want to change the active status of this restaurant?',
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.white,
                    textCancel: 'No',
                    radius: 8.0,
                    titlePadding: const EdgeInsets.only(top: 24),
                    contentPadding: const EdgeInsets.all(24.0),
                    titleStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    onConfirm: () async {
                      // change the status

                      final id = row.getCells().first.value;
                      await userRef.doc(id).update(active: !(dataGridCell.value as bool));
                      Get.find<RestaurantController>().updateDataSource();
                      Get.back();
                      Get.snackbar(
                        'Success',
                        'Restaurant status changed successfully',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      // _restaurants[restaurantIndex].getCells().last.value = !restaurantActive;
                      // notifyDataGridRowChanged(_restaurants[restaurantIndex]);
                      // userRef.doc(restaurantId).update({'active': !restaurantActiveIndex});
                    },
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: dataGridCell.value ? Colors.green : Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(dataGridCell.value ? 'Active' : 'Inactive'))
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
