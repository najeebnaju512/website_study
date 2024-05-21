import 'package:flutter/material.dart';

import '../../../utils/color_theme.dart';

class DesktopMainFrame extends StatelessWidget {
  const DesktopMainFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 350,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "asset/logo/logo.png",
          )),
    );
  }
}