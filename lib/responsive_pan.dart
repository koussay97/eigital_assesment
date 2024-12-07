import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_pan.dart';
import 'package:eigital_assessment/widgets/pan_body.dart';
import 'package:eigital_assessment/widgets/side_bar_menu.dart';
import 'package:eigital_assessment/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/left_pan_content.dart';

class ResponsivePan extends StatelessWidget {
  const ResponsivePan({super.key});

static  GlobalKey<ScaffoldState> scaffoldKey =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      androidMobile: AdaptivePanelWidget(
        scaffoldKey: scaffoldKey,
        topMenu: ApplicationBar(
          onTapMenuBtn: (){
            scaffoldKey.currentState?.openDrawer();
          },
          height:SizeConfig.getDynamicBlocSize(context: context)*10,textScaler: 1.8,),
        numberOfColumns: 1,
        centerPanelWidgetContent: Center(),
        leftPanExpanded: true,
      ),

      androidTablet: AdaptivePanelWidget(
        topMenu: ApplicationBar(height:SizeConfig.getDynamicBlocSize(context: context)*7,textScaler: 1.3,),
        menuWidget: SideBarMenu(
          width: SizeConfig.getDynamicBlocSize(context: context)*7,
        background: AppColors.mainPrimaryBlack,
        ),
        numberOfColumns: 2,
        centerPanelWidgetContent: CenterPanContent(appBarHeight: SizeConfig.getDynamicBlocSize(context: context)*7, textScaler: 1.3,),
        leftPanelWidgetContent: const FirstPanContent(textScaler: 1.3,),
        leftPanExpanded: true,),

      windowsDesktop: AdaptivePanelWidget(
        topMenu: ApplicationBar(height:SizeConfig.getDynamicBlocSize(context: context)*6,),
          menuWidget: SideBarMenu(
            width: SizeConfig.getDynamicBlocSize(context: context)*6,
            background: AppColors.mainPrimaryBlack,
          ),

        centerPanelWidgetContent: CenterPanContent(appBarHeight: SizeConfig.getDynamicBlocSize(context: context)*6,textScaler: 1.3,),
        leftPanelWidgetContent: const FirstPanContent(textScaler: 1.3,),
        rightPanelWidgetContent:null,
        numberOfColumns: 2,leftPanExpanded: true,),
    );
  }
}

