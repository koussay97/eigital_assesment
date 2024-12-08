

import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/data_key_value_vertical.dart';
import 'package:flutter/material.dart';

class TabViewMidSectionUpperCard extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;

  const TabViewMidSectionUpperCard(
      {super.key, required this.theme, this.scaleFactor});

  static List<Map<String, dynamic>> data = [
    {'Last Visit': null},
    {'Average Spent': 0.0},
    {'Lifetime Spent': 0.0},
    {'Total Orders': 0.0},
    {'Average Tip': 0.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: SizeConfig.getDynamicBlocSize(context: context) * 7,
              padding: EdgeInsets.all(
                  SizeConfig.getDynamicBlocSize(context: context)),
              decoration: BoxDecoration(
                color: AppColors.cardsBackground,
                borderRadius: BorderRadius.circular(
                    AssetAccessor.cardRadius(context: context)),
              ),
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      SizeConfig.getDynamicBlocSize(context: context)),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (
                      context,
                      index,
                      ) {
                    if (index == 0) {
                      return DataKeyValVertical(
                        showDivider: true,
                        theme: theme,
                        isCurrencyValue: false,
                        isDateTimeValue: true,
                        label: data[index].keys.first,
                        scaleFactor: scaleFactor,
                        lastVisit: data[index].values.first,
                      );
                    }

                    return DataKeyValVertical(
                      showDivider: true,
                      theme: theme,
                      isCurrencyValue: true,
                      isDateTimeValue: false,
                      label: data[index].keys.first,
                      scaleFactor: scaleFactor,
                      value: data[index].values.first,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == data.length - 1) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          SizeConfig.getDynamicBlocSize(context: context)),
                      child: VerticalDivider(
                        color: AppColors.cardSecondaryLabelColor,
                        width: 2,
                      ),
                    );
                  },
                  itemCount: 5)),
        ),
      ],
    );
  }
}