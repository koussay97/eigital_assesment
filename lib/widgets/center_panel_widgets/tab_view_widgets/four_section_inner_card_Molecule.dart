

import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/data_key_value_vertical_atom.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/inner_card_molecule.dart';
import 'package:flutter/material.dart';

class FourSectionCard extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;
  final ThemeData theme;
  final double? scaleFactor;
  final bool lastIsCurrency;
  const FourSectionCard(
      {super.key,
        required this.lastIsCurrency,
        required this.theme,
        required this.scaleFactor,
        required this.data,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return InnerCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textScaler: TextScaler.linear((scaleFactor??1)),
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: AppColors.cardSecondaryLabelColor),
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: DataKeyValVertical(
                        scaleFactor: scaleFactor,
                        value: data[0].values.first,
                        isDateTimeValue: false,
                        theme: theme,
                        label: data[0].keys.first,
                        isCurrencyValue: false),
                  ),
                  VerticalDivider(
                    color: AppColors.cardSecondaryLabelColor,
                  ),
                  Flexible(child: DataKeyValVertical(
                      scaleFactor: scaleFactor,
                      value: data[1].values.first,
                      isDateTimeValue: false,
                      theme: theme,
                      label: data[1].keys.first,
                      isCurrencyValue: false),)
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context),
            ),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: DataKeyValVertical(
                      scaleFactor: scaleFactor,
                      value: data[2].values.first,
                      isDateTimeValue: false,
                      theme: theme,
                      label: data[2].keys.first,
                      isCurrencyValue: false),
                ),
                VerticalDivider(
                  color: AppColors.cardSecondaryLabelColor,
                ),
                Flexible(child:    DataKeyValVertical(
                    scaleFactor: scaleFactor,
                    value: data[3].values.first,
                    isDateTimeValue: false,
                    theme: theme,
                    label: data[3].keys.first,
                    isCurrencyValue: lastIsCurrency),)
              ],
            ),),
          ],
        ));
  }
}