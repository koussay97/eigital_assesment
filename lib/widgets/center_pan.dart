import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class CenterPanContent extends StatelessWidget {
  final double appBarHeight;
  final double? textScaler;

  const CenterPanContent(
      {super.key, required this.appBarHeight, this.textScaler });

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SingleChildScrollView(

      child: Padding(
        padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appBarHeight,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.chevron_left,
                  color: AppColors.cardLabelColor,
                  // size: SizeConfig.getDynamicBlocSize(context: context) * 3,
                ),
                Text(
                  'Guest Book',
                  style: currentTheme.textTheme.headlineLarge
                      ?.copyWith(color: AppColors.cardLabelColor),
                  textScaler: TextScaler.linear((textScaler ?? 1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),

            Container(
              padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
              decoration: BoxDecoration(
                color: AppColors.cardsHighlightColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(
                    AssetAccessor.cardRadius(context: context)),
                    topLeft: Radius.circular(
                        AssetAccessor.cardRadius(context: context))),
              ),
              child: Column(
                children: [
                 AssetAccessor.drawSvgIcon(iconName: AssetAccessor.guestBookIcon, height: SizeConfig.getDynamicBlocSize(context: context)*5, width: SizeConfig.getDynamicBlocSize(context: context)*3.5),
                SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                 Text(
                   textScaler: TextScaler.linear((textScaler??1)),
                   'Guest Book', style: currentTheme.textTheme.headlineMedium?.copyWith(color: AppColors.mainPrimaryBlack),),
                  SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                  Text('''The guest book feature remembers your guests' dietary needs, allergies, and favorite dishes. It organizes dining preferences for a customized and memorable experience, ensuring each visit is tailored to their individual needs.''',
                    textScaler: TextScaler.linear((textScaler??1)),
                    style: currentTheme.textTheme.bodyLarge,)
                ],
              ),
            ),
            SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),
            Center(child: TabBarComponent(scaleFactor: (textScaler??1),)),




          ],
        ),
      ),
    );
  }
}
