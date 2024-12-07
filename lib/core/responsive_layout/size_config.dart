import "dart:ui";

import "package:flutter/material.dart";

abstract class SizeConfig {
  static double physicalHeight = WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;
  static double physicalWidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  static ViewPadding systemPadding =
      WidgetsBinding.instance.platformDispatcher.views.first.padding;
  static double devicePixelRatio =
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  static double height = physicalHeight / devicePixelRatio;
  static double width = physicalWidth / devicePixelRatio;

  /// use this whenever you do not have screen resizing
  static double getStaticBlocSize() {
    final viewportHeight= height - (systemPadding.bottom + systemPadding.top);
    final viewportWidth= height - (systemPadding.left + systemPadding.right);
    if(viewportWidth<viewportHeight){
      return viewportWidth/100;
    }
    return viewportHeight/100;
  }

  /// use this whenever you do have screen resizing therefore you need to rebuild the ui constraints
  static double getDynamicBlocSize({required BuildContext context}) {
    final double deviceHeight = MediaQuery.of(context).size.height -
        (systemPadding.bottom + systemPadding.top);
    final double deviceWidth = MediaQuery.of(context).size.width -
        (systemPadding.left + systemPadding.right);
    if (deviceWidth < deviceHeight) {
      return deviceWidth / 100;
    }
    return deviceHeight / 100;
  }
}