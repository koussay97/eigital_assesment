import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_component.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final ThemeData currentTheme;
  final double? textScaleFactor;
  const NotesCard({super.key, required this.currentTheme, required this.textScaleFactor});
  static List<String> keysList =['General','Special Relation','Seating Preferences', 'Special notes', 'Allergies'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes',
          style: currentTheme.textTheme.labelMedium?.copyWith(
            color: AppColors.cardSecondaryLabelColor,
          ),
          textScaler: TextScaler.linear((textScaleFactor ?? 1)),
        ),
        SizedBox(
          height: SizeConfig.getDynamicBlocSize(context: context),
        ),
        BigWhiteCard(
          tabContent: ListView.separated(
            scrollDirection: Axis.vertical,
              physics: const  NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getDynamicBlocSize(context: context),
                        vertical: SizeConfig.getDynamicBlocSize(context: context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AssetAccessor.drawSvgIcon(
                                iconName: AssetAccessor.notesIcons[index],
                                height: SizeConfig.getDynamicBlocSize(
                                        context: context) *
                                    2,
                                width: SizeConfig.getDynamicBlocSize(
                                        context: context) *
                                    2),
                            SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                            Text(keysList[index],
                              textScaler: TextScaler.linear((textScaleFactor??1)),
                              style: currentTheme.textTheme.labelLarge?.copyWith(color: AppColors.cardLabelColor),)
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.getDynamicBlocSize(context: context),
                        ),
                        Text('Add notes', style: currentTheme.textTheme.labelSmall?.copyWith(color: AppColors.cardSecondaryLabelColor),)
                      ],
                    ));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.cardSecondaryLabelColor,
                );
              },
              itemCount: AssetAccessor.notesIcons.length),
        ),
      ],
    );
  }
}
