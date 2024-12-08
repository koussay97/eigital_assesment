import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GuestBookCard extends StatelessWidget {
  final ThemeData currentTheme;
  final double? textScaler;
  const GuestBookCard({super.key, required this.currentTheme,this.textScaler});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AppBloc,AppState>(
            builder: (context,state) {
              if(state is PickUserState){
                return InkWell(
                  onTap: (){
                    BlocProvider.of<AppBloc>(context).add(const OpenGuestBook());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: AppColors.cardLabelColor,
                      ),
                      Text(
                        'Guest Book',
                        style: currentTheme.textTheme.headlineLarge
                            ?.copyWith(color: AppColors.cardLabelColor),
                        textScaler: TextScaler.linear((textScaler ?? 1)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }
        ),
        SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),
        Container(
          padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
          decoration: BoxDecoration(
            color: AppColors.cardsHighlightColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(
                AssetAccessor.cardRadius(context: context)),
                topLeft: Radius.circular(
                    AssetAccessor.cardRadius(context: context))),
          ),
          child: Column(
            children: [
              AssetAccessor.drawSvgIcon(iconName: AssetAccessor.guestBookIcon, height: SizeConfig.getDynamicBlocSize(context: context)*5, width: SizeConfig.getDynamicBlocSize(context: context)*3.5),
              SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
              Text(
                textScaler: TextScaler.linear((textScaler??1)),
                'Guest Book', style: currentTheme.textTheme.headlineMedium?.copyWith(color: AppColors.mainPrimaryBlack),),
              SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
              Text('''The guest book feature remembers your guests' dietary needs, allergies, and favorite dishes. It organizes dining preferences for a customized and memorable experience, ensuring each visit is tailored to their individual needs.''',
                textScaler: TextScaler.linear((textScaler??1)),
                style: currentTheme.textTheme.bodyLarge,)
            ],
          ),
        ),
        SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),
      ],
    );
  }
}
