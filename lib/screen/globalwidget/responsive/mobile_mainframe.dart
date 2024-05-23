import 'package:flutter/material.dart';

import '../../../utils/color_theme.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({
    super.key,
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