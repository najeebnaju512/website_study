import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/teacher_list/teacher_model.dart';
import '../teacher_list_controller.dart';
import 'widget/converted_teacher_data.dart';
import 'widget/header_text.dart';

class TeacherDataGrid extends StatefulWidget {
  final TeacherListController controller;
  const TeacherDataGrid({super.key, required this.controller});

  @override
  State<TeacherDataGrid> createState() => TeacherDataGridState();
}

class TeacherDataGridState extends State<TeacherDataGrid> {
  late List<Teacher> teacherlist;
  late ConvertedTeacherData convertedTeacherData;

  @override
  void initState() {
    teacherlist = widget.controller.getTeacher(); // fetching data to UI
    convertedTeacherData = ConvertedTeacherData(teacherlist); // used as widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            allowPullToRefresh: true,
            source: convertedTeacherData,
            columns: [
              GridColumn(
                columnName: 'id',
                label: const HeaderContainer(
                  text: 'ID',
                  fontsize: 16,
                ),
              ),
              GridColumn(
                  columnName: 'name',
                  label: const HeaderContainer(text: "Name", fontsize: 16)),
              GridColumn(
                  columnName: 'subject',
                  label: const HeaderContainer(text: "Subject", fontsize: 16)),
              GridColumn(
                  columnName: 'salary',
                  label: const HeaderContainer(text: "Salary", fontsize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
