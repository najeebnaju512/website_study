import 'package:flutter/material.dart';
import 'package:nexteons_study_project/model/dip_rate_data_model/list.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// Data Conversion for ui==> which act as row in ui of table==>DataGridRowAdapter
class ConvertedGridData extends DataGridSource {
  List<DataGridRow> datagridrow=[];
  ConvertedGridData(List<DipListElement> listitems) {
    datagridrow = listitems.map<DataGridRow>((listitems) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: listitems.id),
        DataGridCell<String>(columnName: 'name', value: listitems.name),
        DataGridCell<int>(columnName: 'subject', value: listitems.rate),
      ]);
    }).toList();
  }

  
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
