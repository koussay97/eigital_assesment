

import 'dart:io';

import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.builder});
  final Widget Function(
      {required BuildContext context,
      required ResponsiveData sizingInformation}) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final ResponsiveData sizingInformation = ResponsiveData(
              screenType: getDeviceScreenType(context),
              platform: !kIsWeb
                  ? getDevicePlatformType(
                  operationSystemName: Platform.operatingSystem)
                  : DevicePlatformType.web,
              screenSize: MediaQuery.of(context).size,
              widgetSize: constraints.biggest);
          return builder(context: context, sizingInformation: sizingInformation);
        });
  }
}

DevicePlatformType getDevicePlatformType(
    {required String operationSystemName}) {
  if (kIsWeb) {
    return DevicePlatformType.web;
  }
  switch (operationSystemName) {
    case 'android':
      return DevicePlatformType.android;
    case 'fuchsia':
      return DevicePlatformType.fuchsia;
    case 'ios':
      return DevicePlatformType.ios;
    case 'linux':
      return DevicePlatformType.linux;
    case 'windows':
      return DevicePlatformType.windows;
    default:
      return DevicePlatformType.macOs;
  }
}

DeviceScreenType getDeviceScreenType(BuildContext context) {
  final deviceWidth = MediaQuery.of(context).size.width;

  ///medium (768px), large (992px), extra large (1200px), and extra extra large (1400px).
  /// container common web standard of large (960px), extra large (1140px), and extra extra large (1320px).
  switch (deviceWidth) {
    case <= 300:
      return DeviceScreenType.watch;
      /// this used
    case (<= 600 && > 300):
      return DeviceScreenType.mobile;
      /// adjusted this to my prefs
    case (<= 1200 && > 600):
      return DeviceScreenType.tablet;
    case (<= 1400 && > 1200):
      return DeviceScreenType.deskTop;
    default:
      return DeviceScreenType.extraLargeDeskTop;
  }
}