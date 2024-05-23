import 'package:flutter/material.dart';
import 'package:nexteons_study_project/screen/mainFrame/widget/frame_button.dart';

import '../../../utils/color_theme.dart';
import '../main_frame_controller.dart';

class TabletMainFrame extends StatelessWidget {
  final MainFrameController controller;
  const TabletMainFrame({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: 250,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 63, right: 35, left: 35),
      child: Wrap(
        runSpacing: size.height * .04,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "asset/logo/logo.png",
              )),
              const SizedBox(height: 20,),
          FrameButton(
              fontsize: 15, onpress: () {}, text: "Students", height: 40),
          FrameButton(
              fontsize: 15, onpress: () {}, text: "Teachers", height: 40)
        ],
      ),
    );
  }
}
