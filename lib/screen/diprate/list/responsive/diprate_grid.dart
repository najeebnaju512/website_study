import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../utils/loading_page.dart';
import '../diprate_list_controller.dart';
import 'widget/converted_grid_data.dart';
import 'widget/header_text.dart';

class DpiDataGrid extends StatelessWidget {
  final DipRateListController controller;
  const DpiDataGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Obx(() {
            final convertedTeacherData =
                ConvertedGridData(controller.dpilist); // used as widget
            return controller.isLoading == true
                ? LoadingPage()
                : SfDataGrid(
                    columnResizeMode: ColumnResizeMode.onResize,
                    allowColumnsResizing: true,
                    allowColumnsDragging: true,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    allowPullToRefresh: true,
                    source: convertedTeacherData,
                    columns: [
                      GridColumn(
                          columnName: 'id',
                          label:
                              const HeaderContainer(text: 'ID', fontsize: 16)),
                      GridColumn(
                          columnName: 'name',
                          label: const HeaderContainer(
                              text: "Name", fontsize: 16)),
                      GridColumn(
                          columnName: 'rate',
                          label: const HeaderContainer(
                              text: "Rate", fontsize: 16)),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
