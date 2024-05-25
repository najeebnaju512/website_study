import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/color_theme.dart';
import '../main_frame_controller.dart';
import '../../widget/app_button.dart';

class DesktopMainFrame extends StatelessWidget {
  final MainFrameController controller;
  const DesktopMainFrame({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: 350,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: Wrap(
        runSpacing: size.height * .04,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "asset/logo/logo.png",
              )),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.buttonData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AppButton(
                    fontsize: 20,
                    onpress: () {
                      context.goNamed(controller.buttonData[index].route);
                    },
                    text: controller.buttonData[index].title,
                    height: 50),
              );
            },
          )
        ],
      ),
    );
  }
}
