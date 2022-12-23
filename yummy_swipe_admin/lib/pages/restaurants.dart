import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:yummy_swipe_admin/controller/restaurant.controller.dart';
import 'package:yummy_swipe_admin/models/restaurant/restaurant.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(
      init: RestaurantController(),
      builder: (controller) {
        if (!controller.isDataFecthed) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Theme(
          data: context.theme.copyWith(
            textTheme: GoogleFonts.notoSansAdlamTextTheme(),
          ),
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  child: SfDataGrid(
                    columnWidthMode: ColumnWidthMode.fill,
                    allowFiltering: true,
                    source: controller.dataSource,
                    allowColumnsResizing: true,
                    columns: [
                      GridColumn(
                        autoFitPadding: const EdgeInsets.all(16.0),
                        columnName: 'id',
                        label: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('ID'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'name',
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('Name'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Owner Name',
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('Owner Name'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Phone',
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('Phone'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'active',
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('Active'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
