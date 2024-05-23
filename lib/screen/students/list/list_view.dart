import 'package:flutter/material.dart';
import 'package:nexteons_study_project/utils/responsive_layout.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/desktop_result_screen.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/tablet_result_screen.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/mobile_result_screen.dart';

import '../../globalwidget/main_frame_view_adjuster.dart';

class StudentResultList extends StatefulWidget {
  const StudentResultList({super.key});

  @override
  State<StudentResultList> createState() => _StudentResultListState();
}

class _StudentResultListState extends State<StudentResultList> {
  @override
  Widget build(BuildContext context) {
    return const FrameAdjuster(
        child: ResponsiveLayout(
            mobileBody: MobileResultScreen(),
            tabletBody: TabletResultScreen(),
            desktopBody: DesktopResultScreen()));
  }
}
