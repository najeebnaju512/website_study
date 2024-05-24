import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/responsive_layout.dart';
import '../../mainFrame/main_frame_view_adjuster.dart';
import 'responsive/diprate_grid.dart';
import 'diprate_list_controller.dart';

class DipRateListView extends StatefulWidget {
  const DipRateListView({super.key});

  @override
  State<DipRateListView> createState() => _DipRateListViewState();
}

class _DipRateListViewState extends State<DipRateListView> {
  late DipRateListController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(DipRateListController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DipRateListController>(tag: tag);
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
