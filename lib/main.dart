import 'package:flutter/material.dart';
import 'package:nexteons_study_project/view/desktop/desktop_screen.dart';
import 'package:nexteons_study_project/view/mobile/mobile_screen.dart';
import 'package:nexteons_study_project/view/responsive_layout.dart';
import 'package:nexteons_study_project/view/tablet/tablet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nexteons Study',
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
            mobileBody: MobileScreen(),
            tabletBody: TabletScreen(),
            desktopBody: DesktopScreen())
            );
  }
}
