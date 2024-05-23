import 'package:flutter/material.dart';

import '../../utils/color_theme.dart';

class TabletMainFrame extends StatelessWidget {
  const TabletMainFrame({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 63, right: 35, left: 35),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "asset/logo/logo.png",
          )),
    );
  }
}