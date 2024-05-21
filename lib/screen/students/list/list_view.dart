import 'package:flutter/material.dart';
import 'package:nexteons_study_project/responsive_layout.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/desktop_result_screen.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/tablet_result_screen.dart';
import 'package:nexteons_study_project/screen/students/list/responsive/mobile_result_screen.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: MobileResultScreen(),
        tabletBody: TabletResultScreen(),
        desktopBody: DesktopResultScreen());
  }
}
