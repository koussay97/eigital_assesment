

import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/data_key_value_vertical_atom.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/inner_card_molecule.dart';
import 'package:flutter/material.dart';

class TabViewMidSectionUpperCard extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;
 final List<Map<String, dynamic>> data;
  const TabViewMidSectionUpperCard(
      {super.key, required this.theme, this.scaleFactor,required this.data });



  @override
  Widget build(BuildContext context) {
    return InnerCard(
      maxHeight: SizeConfig.getDynamicBlocSize(context: context)*8,
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

                  theme: theme,
                  isCurrencyValue: false,
                  isDateTimeValue: true,
                  label: data[index].keys.first,
                  scaleFactor: scaleFactor,
                  lastVisit: data[index].values.first,
                );
              }

              return DataKeyValVertical(

                theme: theme,
                isCurrencyValue: true,
                isDateTimeValue: false,
                label: data[index].keys.first,
                scaleFactor: scaleFactor,
                value: double.parse(data[index].values.first.toString()),
              );
            },
            separatorBuilder: (context, index) {
              if (index == data.length - 1) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    SizeConfig.getDynamicBlocSize(context: context)*2),
                child: VerticalDivider(
                  color: AppColors.cardSecondaryLabelColor,
                  width: 2,
                ),
              );
            },
            itemCount: 5));
  }
}