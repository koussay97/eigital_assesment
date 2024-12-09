

import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class DataKeyValVertical extends StatelessWidget {
  final double? scaleFactor;

  final double? value;
  final String label;
  final bool isCurrencyValue;

  final bool isDateTimeValue;
  final ThemeData theme;
  final DateTime? lastVisit;

  const DataKeyValVertical({
    super.key,

    required this.isDateTimeValue,
    this.lastVisit,
    required this.theme,
    this.scaleFactor,
    required this.label,
    this.value,
    required this.isCurrencyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear((scaleFactor ?? 1)),
          '${isCurrencyValue ? '\$${value?.toString().padRight(2, '0')}' : isDateTimeValue ? formatDate(date: lastVisit) : value?.round()}',
          style: theme.textTheme.headlineMedium
              ?.copyWith(color: AppColors.mainPrimaryBlack),
        ),
        Expanded(
          child: SizedBox(
            height: SizeConfig.getDynamicBlocSize(context: context),
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear((scaleFactor ?? 1)),
          label,
          style: theme.textTheme.labelSmall
              ?.copyWith(color: AppColors.mainPrimaryBlack),
        )
      ],
    );
  }
}