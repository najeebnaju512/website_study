import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/responsive_layout.dart';
import '../../mainFrame/main_frame_view_adjuster.dart';
import 'responsive/teacher_list_grid.dart';
import 'teacher_list_controller.dart';

class TeacherListView extends StatefulWidget {
  const TeacherListView({super.key});

  @override
  State<TeacherListView> createState() => _TeacherListViewState();
}

class _TeacherListViewState extends State<TeacherListView> {
  late TeacherListController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(TeacherListController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<TeacherListController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FrameAdjuster(
      child: ResponsiveLayout(
          mobileBody: TeacherDataGrid(controller: controller),
          tabletBody: TeacherDataGrid(controller: controller),
          desktopBody: TeacherDataGrid(controller: controller)),
    );
  }
}
