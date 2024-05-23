import 'package:flutter/material.dart';

import '../../../utils/color_theme.dart';
import '../main_frame_controller.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MainFrameController controller;
  const MobileAppBar({
    super.key, required this.controller,
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "asset/logo/logo.png",
        width: 100,
        height: 16,
      ),
      backgroundColor: ColorTheme.lightBlue,
    );
  }
}
