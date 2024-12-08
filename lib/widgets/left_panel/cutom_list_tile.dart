import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


/// CustomListTile widget
/// this custom list tile was created because the regular one does not allow loose constraints
class CustomListTile extends StatelessWidget {
  final UserClass user;
  final ThemeData theme;
  final double? scaleFactor;

  const CustomListTile(
      {super.key, required this.user, required this.theme, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        BlocProvider.of<AppBloc>(context).add(PickUser(userId: user.id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: user.selected
              ? AppColors.cardSecondaryLabelColor
              : AppColors.mainBackground,
          borderRadius:
          BorderRadius.circular(AssetAccessor.cardRadius(context: context)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  width: SizeConfig.getDynamicBlocSize(context: context) *
                      5 *
                      (scaleFactor ?? 1),
                  height: SizeConfig.getDynamicBlocSize(context: context) *
                      5 *
                      (scaleFactor ?? 1),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.white60.withOpacity(0.3))
                    ],
                    shape: BoxShape.circle,
                    color: user.image == null ? AppColors.cardLabelColor : null,
                    image: user.image != null
                        ? DecorationImage(image: AssetImage(user.image!))
                        : null,
                  ),
                  child: user.image != null
                      ? null
                      : Center(
                      child: Text(
                        '${user.name.substring(0, 2).toUpperCase()}',
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(color: AppColors.cardsHighlightColor),
                      )),
                )),
            Expanded(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      textScaler: TextScaler.linear((scaleFactor ?? 1)),
                      style: theme.textTheme.headlineLarge
                          ?.copyWith(color: AppColors.mainPrimaryBlack),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height:
                      SizeConfig.getDynamicBlocSize(context: context) * .6,
                    ),
                    Text(
                        textScaler: TextScaler.linear((scaleFactor ?? 1)),
                        user.email,
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.mainPrimaryBlack),
                        overflow: TextOverflow.ellipsis),
                    Text(
                      textScaler: TextScaler.linear((scaleFactor ?? 1)),
                      user.phoneNumber,
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: AppColors.mainPrimaryBlack),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
///// this is the shimmer tile widget
class CustomListTileShimmer extends StatelessWidget {
  final double? scaleFactor;

  const CustomListTileShimmer({super.key, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  SizeConfig.getDynamicBlocSize(context: context)*10,
      decoration: BoxDecoration(
        color: AppColors.cardsBackground,
        borderRadius:
            BorderRadius.circular(AssetAccessor.cardRadius(context: context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: SizeConfig.getDynamicBlocSize(context: context) *
                  5 *
                  (scaleFactor ?? 1),
              height: SizeConfig.getDynamicBlocSize(context: context) *
                  5 *
                  (scaleFactor ?? 1),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.white60.withOpacity(0.3))],
                shape: BoxShape.circle,
                color: AppColors.cardSecondaryLabelColor,
              ),
            ),
          ),
          SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: SizeConfig.getDynamicBlocSize(context: context)*40,
                      height:
                          SizeConfig.getDynamicBlocSize(context: context) * 1.61*(scaleFactor??1),
                      decoration: BoxDecoration(
                        color: AppColors.cardSecondaryLabelColor,
                        borderRadius: BorderRadius.circular(
                            AssetAccessor.cardRadius(context: context)),
                      )),
                ),
                SizedBox(
                  height:
                  SizeConfig.getDynamicBlocSize(context: context) * .6,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: SizeConfig.getDynamicBlocSize(context: context)*40,
                      height:
                      SizeConfig.getDynamicBlocSize(context: context) * 1.1*(scaleFactor??1),
                      decoration: BoxDecoration(
                        color: AppColors.cardSecondaryLabelColor,
                        borderRadius: BorderRadius.circular(
                            AssetAccessor.cardRadius(context: context)),
                      )),
                ),
                SizedBox(
                  height:
                  SizeConfig.getDynamicBlocSize(context: context) * .3,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: SizeConfig.getDynamicBlocSize(context: context)*40,
                      height:
                      SizeConfig.getDynamicBlocSize(context: context) * 1.1*(scaleFactor??1),
                      decoration: BoxDecoration(
                        color: AppColors.cardSecondaryLabelColor,
                        borderRadius: BorderRadius.circular(
                            AssetAccessor.cardRadius(context: context)),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
