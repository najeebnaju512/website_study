import 'package:flutter/material.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/teacher_list/teacher_model.dart';
import '../teacher_list_controller.dart';
import 'widget/converted_teacher_data.dart';

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
    convertedTeacherData = ConvertedTeacherData(teacherlist);//used as widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: SfDataGrid(
            allowSorting: true,
            allowPullToRefresh: true,
            source: convertedTeacherData,
            columns: [
              GridColumn(
                columnName: 'id',
                label: Container(
                  color: ColorTheme.lightBlue.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'ID',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'name',
                label: Container(
                  color: ColorTheme.lightBlue.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Name',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'subject',
                label: Container(
                  color: ColorTheme.lightBlue.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Subject',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'salary',
                label: Container(
                  color: ColorTheme.lightBlue.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Salary',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
