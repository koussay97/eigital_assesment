import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:flutter/material.dart';

class InnerCard extends StatelessWidget {
  final Widget child;
  final double? maxHeight;
  final double? maxWidth;
  const InnerCard({
    super.key,
    this.maxHeight,
    this.maxWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:maxWidth??double.infinity,
      constraints: BoxConstraints(
          maxHeight: maxHeight??SizeConfig.getDynamicBlocSize(context: context)*15),
      padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
      decoration: BoxDecoration(
        color: AppColors.cardsBackground,
        borderRadius:
        BorderRadius.circular(AssetAccessor.cardRadius(context: context)),
      ),
      child: Column(

        children: [
          Expanded(child: child),
        ],
      ),
    );
  }
}