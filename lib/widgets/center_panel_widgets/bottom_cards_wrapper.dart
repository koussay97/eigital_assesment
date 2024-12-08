
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/bottom_cards_over_view_card.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/inner_card.dart';
import 'package:flutter/material.dart';

class TabViewMidSectionLowerCards extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;
  const TabViewMidSectionLowerCards({super.key, required this.theme, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 16,
            child: InnerCard(
              child: OverViewCardContent(
                theme: theme,
                scaleFactor: scaleFactor,
              ),
            )),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 11,
            child: Container(
                color: AppColors.mainBackground,
                height: SizeConfig.getDynamicBlocSize(context: context) * 4)),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 11,
            child: Container(
              color: AppColors.mainBackground,
              height: SizeConfig.getDynamicBlocSize(context: context) * 4,
            ))
      ],
    );
  }
}