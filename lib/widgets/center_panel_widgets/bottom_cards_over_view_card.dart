
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';
class OverViewCardContent extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;
  const OverViewCardContent({super.key, required this.theme, this.scaleFactor});

  static List<Map<String, dynamic>> data = [
    {'Loyalty NO': 'RF|'},
    {'Customer Since': DateTime( 2010,2, 10)},
    {'Birth Date': '--'},
    {'Anniversary': DateTime( 2003,11, 11)},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    textScaler:TextScaler.linear((scaleFactor??1)) ,
                    data[index].keys.first,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: AppColors.mainPrimaryBlack),
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  textScaler:TextScaler.linear((scaleFactor??1)) ,
                  data[index].values.first,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                )
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(overflow: TextOverflow.ellipsis,

                  textScaler:TextScaler.linear((scaleFactor??1)) ,
                  data[index].keys.first,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                textScaler:TextScaler.linear((scaleFactor??1)) ,
                (DateTime.tryParse(data[index].values.first.toString())==null? 'Enter':formatDate(date: data[index].values.first as DateTime)),
                style: theme.textTheme.labelMedium
                    ?.copyWith(color: AppColors.cardSecondaryLabelColor),
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: AppColors.cardSecondaryLabelColor,
          );
        },
        itemCount: data.length);
  }
}