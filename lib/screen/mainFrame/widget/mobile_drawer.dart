import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/screen/mainFrame/main_frame_controller.dart';

import '../../../utils/color_theme.dart';
import 'frame_button.dart';

class DrawerRefactored extends StatelessWidget {
  final MainFrameController controller;
  const DrawerRefactored({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * .4,
      backgroundColor: ColorTheme.lightBlue,
      child: Container(
        // color: ColorTheme.lightBlue,
        padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
        child: Wrap(
          runSpacing: size.height * .04,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "asset/logo/logo.png",
                )),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.buttonData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: FrameButton(
                      fontsize: 12,
                      onpress: () {
                        context.goNamed(controller.buttonData[index].route);
                      },
                      text: controller.buttonData[index].title,
                      height: 30),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
