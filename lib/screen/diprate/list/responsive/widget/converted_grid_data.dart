import 'package:flutter/material.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../model/teacher_list/teacher_model.dart';

// Data Conversion for ui==> which act as row in ui of table==>DataGridRowAdapter
class ConvertedGridData extends DataGridSource {
  ConvertedGridData(List<Teacher> teacher) {
    datagridrow = teacher
        .map<DataGridRow>((teacher) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: teacher.id),
              DataGridCell<String>(columnName: 'name', value: teacher.name),
              DataGridCell<String>(
                  columnName: 'subject', value: teacher.subject),
              DataGridCell<double>(columnName: 'salary', value: teacher.salary),
            ]))
        .toList();
  }

  late List<DataGridRow> datagridrow;
  @override
  List<DataGridRow> get rows => datagridrow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: ColorTheme.grey,
      cells: row.getCells().map<Widget>((datagridcell) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          alignment: Alignment.center,
          child: Text(
            datagridcell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
