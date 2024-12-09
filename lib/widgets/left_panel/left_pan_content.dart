import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:eigital_assessment/widgets/left_panel/cutom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FirstPanContent extends StatelessWidget {
  final double? textScaler;

  const FirstPanContent({super.key, this.textScaler});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.all(AssetAccessor.appPadding(context: context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 7,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.chevron_left,
                    color: AppColors.cardLabelColor,
                    // size: SizeConfig.getDynamicBlocSize(context: context) * 3,
                  ),
                ),
                Expanded(
                    flex: 9,
                    child: Text(
                      'Settings',
                      style: currentTheme.textTheme.headlineLarge
                          ?.copyWith(color: AppColors.cardLabelColor),
                      textScaler: TextScaler.linear((textScaler ?? 1)),
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            TextField(
              onChanged: (newVal){
                BlocProvider.of<AppBloc>(context).add(FilterUsers(filterString: newVal));
              },
              decoration: InputDecoration(
                fillColor: AppColors.cardSecondaryLabelColor,
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.cardLabelColor,
                  size: SizeConfig.getDynamicBlocSize(context: context) * 2,
                ),
                alignLabelWithHint: true,
                filled: true,
                suffixIcon: Icon(
                  Icons.mic_none_rounded,
                  color: AppColors.cardLabelColor,
                  size: SizeConfig.getDynamicBlocSize(context: context) * 2,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: currentTheme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.cardLabelColor),
              ),
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             Expanded(
               flex: 2,
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                   Container(
                     padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
                     decoration: BoxDecoration(
                       color: AppColors.mainPrimaryBlack,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Icon(Icons.add, color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*2),
                   ),
                     SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                     GestureDetector(
                       onTap: (){},
                       child: Container(
                         padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
                         decoration: BoxDecoration(
                           color: AppColors.cardLabelColor,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Icon(Icons.archive_outlined, color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*2),
                       ),
                     )

                   ],),
               ),
             ),
                Flexible(
                    flex: 3,
                    child: InkWell(
                      onTap: (){
                        BlocProvider.of<AppBloc>(context).add(const SortUsers());
                      },
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
                        decoration: BoxDecoration(
                          color: AppColors.cardSecondaryLabelColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.sort_by_alpha, color: AppColors.mainPrimaryBlack,size: SizeConfig.getDynamicBlocSize(context: context)*2,),
                      ),
                    ),)
            ],),

            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            BlocBuilder<AppBloc,AppState>(

              builder: (context,state) {


                if(state is LoadUsersDataLoadingState||state is AppInitial ){
                  return ListView.separated(
                    shrinkWrap: true,
                      itemBuilder: (context, state){
                        return CustomListTileShimmer(scaleFactor: textScaler,);
                      },
                      separatorBuilder: (context, state){
                        return Divider(
                          color: AppColors.cardSecondaryLabelColor,
                        );
                      },
                      itemCount: 10);
                }
                if(state.users.isEmpty){
                  return const SizedBox.shrink();
                }

                return ListView.separated(
                 physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomListTile(theme: currentTheme,user: state.users[index], scaleFactor: textScaler,);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.cardSecondaryLabelColor,
                      );
                    },
                    itemCount: state.users.length);
              }
            )
          ],
        ),
      ),
    );
  }
}

