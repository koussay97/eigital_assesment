import 'package:eigital_assessment/core/responsive_layout/device_types.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  // all mobile variants
  final Widget androidMobile;
  Widget? iosMobile;
  Widget? webMobile;

  // all desktop variants
  final Widget windowsDesktop;
  Widget? macOSDesktop;
  Widget? linuxDesktop;
  Widget? fuchsiaDesktop;
  Widget? webDesktop;
  Widget? extraLarge;
  final Widget androidTablet;
  Widget? iosTablet;
  Widget? webTablet;

  Widget? watch;

  ResponsiveBuilder({
    super.key,
    required this.androidMobile,
    required this.windowsDesktop,
    required this.androidTablet,
    this.extraLarge,
    this.watch,
    this.fuchsiaDesktop,
    this.iosMobile,
    this.iosTablet,
    this.linuxDesktop,
    this.macOSDesktop,
    this.webDesktop,
    this.webMobile,
    this.webTablet,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: ({required context, required sizingInformation}) {
        if (sizingInformation.screenType ==
            DeviceScreenType.extraLargeDeskTop) {
          if (extraLarge != null) {
            return extraLarge!;
          }
          return windowsDesktop;
        }
        if (sizingInformation.screenType == DeviceScreenType.mobile) {
          /// if ios mobile variant widget supplied always
          /// and platform is ios return the iosMobile widget
          if (sizingInformation.platform == DevicePlatformType.ios &&
              iosMobile != null) {
            return iosMobile!;
          }

          /// if web mobile variant widget supplied always
          /// and platform is web return the webMobile widget
          if (sizingInformation.platform == DevicePlatformType.web &&
              webMobile != null) {
            return webMobile!;
          }

          /// if no mobile variant widget supplied always return
          /// the android widget by default
          return androidMobile;
        }

        if (sizingInformation.screenType == DeviceScreenType.tablet) {
          /// if ios tablet variant widget supplied always
          /// and platform is ios return the iosTablet widget

          if (sizingInformation.platform == DevicePlatformType.ios &&
              iosTablet != null) {
            return iosTablet!;
          }

          /// if web tablet variant widget supplied always
          /// and platform is web return the webTablet widget
          if (sizingInformation.platform == DevicePlatformType.web &&
              webTablet != null) {
            return webTablet!;
          }

          /// if no mobile variant widget supplied always return
          /// the android widget by default
          return androidTablet;
        }

        /// same idea as the other options

        if (sizingInformation.screenType == DeviceScreenType.deskTop) {
          if (sizingInformation.platform == DevicePlatformType.linux &&
              linuxDesktop != null) {
            return linuxDesktop!;
          }
          if (sizingInformation.platform == DevicePlatformType.fuchsia &&
              fuchsiaDesktop != null) {
            return fuchsiaDesktop!;
          }
          if (sizingInformation.platform == DevicePlatformType.macOs &&
              macOSDesktop != null) {
            return macOSDesktop!;
          }
          if (sizingInformation.platform == DevicePlatformType.web &&
              webDesktop != null) {
            return webDesktop!;
          }

          /// by default return the windows desktop version
          return windowsDesktop;
        }

        return Text(
            'there is no UI support for this platform ${MediaQuery.of(context).size.width}');
      },
    );
  }
}