import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:flutter/material.dart';

class InnerCard extends StatelessWidget {
  final Widget child;

  const InnerCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: SizeConfig.getDynamicBlocSize(context: context)*15),
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