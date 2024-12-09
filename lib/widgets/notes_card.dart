import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_component.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final ThemeData currentTheme;
  final double? textScaleFactor;
  const NotesCard({super.key, required this.currentTheme, required this.textScaleFactor});

  @override
  Widget build(BuildContext context) {
    return BigWhiteCard(
      tabContent: ListView.separated(
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
                        Text('General', style: currentTheme.textTheme.labelLarge?.copyWith(color: AppColors.cardLabelColor),)
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getDynamicBlocSize(context: context),
                    ),

                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.cardSecondaryLabelColor,
            );
          },
          itemCount: AssetAccessor.notesIcons.length),
    );
  }
}
