import 'package:eigital_assessment/core/responsive_layout/device_types.dart';
import 'package:flutter/cupertino.dart';


class ResponsiveData {
  final DeviceScreenType screenType;
  final DevicePlatformType platform;
  //final Orientation orientation;
  final Size screenSize;
  final Size widgetSize;

  ResponsiveData(
      {required this.screenType,
        required this.platform,
        //required this.orientation,
        required this.screenSize,
        required this.widgetSize});
  @override
  String toString() =>
      'screenType : $screenType, platform: $platform, screenSize: $screenSize, widgetSize: $widgetSize';
}