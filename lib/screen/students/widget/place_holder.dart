import 'package:flutter/material.dart';

import '../../../utils/check_size.dart';
import 'desktop_mainframe.dart';
import 'mobile_mainframe.dart';
import 'tablet_mainframe.dart';

class FrameAdjuster extends StatelessWidget {
  const FrameAdjuster({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
            appBar: fnCheckMobile(size.width) ? const MobileAppBar() : null,
            body: Row(
              children: [
                if (fnCheckTablet(size.width) && !fnCheckMobile(size.width))
                  const TabletMainFrame(),
                if (!fnCheckMobile(size.width) && !fnCheckTablet(size.width))
                  const DesktopMainFrame(),
                Expanded(child: child)
              ],
            ));
      },
    );
  }
}
