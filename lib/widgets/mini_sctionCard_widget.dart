import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_component.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/custom_vertical_divider_atom.dart';
import 'package:flutter/material.dart';

class MiniSectionWidget extends StatelessWidget {
  final String title;

  final double? scaleFactor;
  final ThemeData themeData;

  final String iconName;
  final String iconTitle;
  final String btnLabel;
  const MiniSectionWidget(
      {super.key,
        required this.iconName,
        required this.iconTitle,
        required this.themeData,
        required this.title,
        required this.btnLabel,
        this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: themeData.textTheme.labelMedium?.copyWith(
            color: AppColors.cardSecondaryLabelColor,
          ),
          textScaler: TextScaler.linear((scaleFactor ?? 1)),
        ),
        SizedBox(
          height: SizeConfig.getDynamicBlocSize(context: context),
        ),

        ///
        BigWhiteCard(
          tabContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AssetAccessor.drawSvgIcon(
                      iconName: iconName,
                      height:
                      SizeConfig.getDynamicBlocSize(context: context) * 3*(scaleFactor??1),
                      width:
                      SizeConfig.getDynamicBlocSize(context: context) * 3*(scaleFactor??1)),

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getDynamicBlocSize(context: context)*2),
                      child: CustomVerticalDivider(color: AppColors.cardLabelColor,thickness: 1, height: SizeConfig.getDynamicBlocSize(context: context) * 3*(scaleFactor??1),)),
                  Text(
                      textScaler: TextScaler.linear((scaleFactor??1)),
                      iconTitle),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.mainPrimaryBlack),
                  ),
                  onPressed: (){

                  }, child: Text(
                style: themeData.textTheme.labelLarge?.copyWith(color: AppColors.cardsHighlightColor),
                btnLabel,
                textScaler: TextScaler.linear((scaleFactor??1)),))
            ],
          ),
        ),
      ],
    );
  }
}