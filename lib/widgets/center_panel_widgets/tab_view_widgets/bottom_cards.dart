import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/inner_card_molecule.dart';
import 'package:flutter/material.dart';

class BottomCards extends StatelessWidget {
  final double? scaleFactor;
  final ThemeData currentTheme;

  const BottomCards({super.key, this.scaleFactor, required this.currentTheme});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: SizeConfig.getDynamicBlocSize(context: context) * 2,
        ),
        Row(
          children: [
            Flexible(
              child: InnerCard(
                  maxHeight:
                      SizeConfig.getDynamicBlocSize(context: context) * 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AssetAccessor.drawSvgIcon(
                          iconName: AssetAccessor.pieIcon,
                          height:
                              SizeConfig.getDynamicBlocSize(context: context) *
                                  3,
                          width:
                              SizeConfig.getDynamicBlocSize(context: context) *
                                  3),
                      SizedBox(
                        width: SizeConfig.getDynamicBlocSize(context: context),
                      ),
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear((scaleFactor ?? 1)),
                          'No Ordered Items',
                          style: currentTheme.textTheme.labelMedium
                              ?.copyWith(color: AppColors.mainPrimaryBlack),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              width: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            Flexible(
              child: InnerCard(
                  maxHeight:
                      SizeConfig.getDynamicBlocSize(context: context) * 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.car_repair,
                        color: AppColors.cardLabelColor,
                        size:
                            SizeConfig.getDynamicBlocSize(context: context) * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.getDynamicBlocSize(context: context),
                      ),
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear((scaleFactor ?? 1)),
                          'No recent vehicle to show',
                          style: currentTheme.textTheme.labelMedium
                              ?.copyWith(color: AppColors.mainPrimaryBlack),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}

class OtherCards extends StatelessWidget {
  final ThemeData currentTheme;
  final double? scaleFactor;

  const OtherCards({super.key, required this.currentTheme, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: InnerCard(
              maxHeight: SizeConfig.getDynamicBlocSize(context: context) * 20,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                //  mainAxisSize: MainAxisSize.min,
                  children: [
                    AssetAccessor.drawSvgIcon(
                        iconName: AssetAccessor.pieIcon,
                        height:
                            SizeConfig.getDynamicBlocSize(context: context) * 3,
                        width:
                            SizeConfig.getDynamicBlocSize(context: context) * 3),
                    SizedBox(
                      width: SizeConfig.getDynamicBlocSize(context: context),
                    ),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear((scaleFactor ?? 1)),
                        'No Ordered Items',
                        style: currentTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.mainPrimaryBlack),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(
          height: SizeConfig.getDynamicBlocSize(context: context) * 2,
        ),
        Flexible(
          flex: 1,
          child: InnerCard(
              maxHeight: SizeConfig.getDynamicBlocSize(context: context) * 8,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.car_repair,
                      color: AppColors.cardLabelColor,
                      size:
                          SizeConfig.getDynamicBlocSize(context: context) * 3,
                    ),
                    SizedBox(
                      width: SizeConfig.getDynamicBlocSize(context: context),
                    ),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear((scaleFactor ?? 1)),
                        'No recent vehicle to show',
                        style: currentTheme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.mainPrimaryBlack),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
