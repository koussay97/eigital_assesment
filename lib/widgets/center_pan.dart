import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/guest_book_card.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_component.dart';
import 'package:eigital_assessment/widgets/mini_sctionCard_widget.dart';
import 'package:eigital_assessment/widgets/notes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterPanContent extends StatelessWidget {
  final double appBarHeight;
  final double? textScaler;

  const CenterPanContent(
      {super.key, required this.appBarHeight, this.textScaler});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: appBarHeight,
            ),
            GuestBookCard(
              currentTheme: currentTheme,
              textScaler: textScaler,
            ),
            Center(
                child: TabBarComponent(
              scaleFactor: (textScaler ?? 1),
            )),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            MiniSectionWidget(
              hideBtn: false,
              themeData: currentTheme,
              scaleFactor: textScaler,
              title: 'Allergy'.toUpperCase(),
              btnLabel: 'Add',
              iconName: AssetAccessor.forkKnifeIcon,
              iconTitle: 'No Allergies',
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            MiniSectionWidget(
              hideBtn: false,
              themeData: currentTheme,
              scaleFactor: textScaler,
              title: 'Upcoming Visits'.toUpperCase(),
              btnLabel: 'Book A Visit',
              iconName: AssetAccessor.storeIcon,
              iconTitle: 'No Upcoming Visits',
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            NotesCard(
              currentTheme: currentTheme,
              textScaleFactor: textScaler,
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            MiniSectionWidget(
              hideBtn: true,
              themeData: currentTheme,
              scaleFactor: textScaler,
              title: 'Recent Orders'.toUpperCase(),
              btnLabel: '--',
              iconName: AssetAccessor.spoonKnifeIcon,
              iconTitle: 'No Recent Orders to Show',
            ),
            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            ReviewBox(currentTheme: currentTheme,textScaler: textScaler,),
          ],
        ),
      ),
    );
  }
}

class ReviewBox extends StatelessWidget {
  final ThemeData currentTheme;
  final double? textScaler;

  const ReviewBox({super.key, required this.currentTheme, this.textScaler});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (prevState, currentState) => currentState is PickUserState,
        builder: (context, state) {
          if (state is PickUserState) {
            if ((state.pickedUser.reviews ?? []).isEmpty) {
              return MiniSectionWidget(
                hideBtn: true,
                themeData: currentTheme,
                scaleFactor: textScaler,
                title: 'Recent Reviews'.toUpperCase(),
                btnLabel: '--',
                iconName: AssetAccessor.emptyReviewIcon,
                iconTitle: 'No Recent Reviews to Show',
              );
            }
            return Column(
   crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Reviews'.toUpperCase(),
                  style: currentTheme.textTheme.labelMedium?.copyWith(
                    color: AppColors.cardSecondaryLabelColor,
                  ),
                  textScaler: TextScaler.linear((textScaler ?? 1)),
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context)*2,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context)*20,

                  child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.pickedUser.reviews!.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: SizeConfig.getDynamicBlocSize(context: context) * 5,
                        );
                      },
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          /// google image is svg and its on index 0
                          return BigWhiteCard(
                            tabContent: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AssetAccessor.drawSvgIcon(
                                    iconName: state.pickedUser.reviews![0].reviewImage,
                                    height: SizeConfig.getDynamicBlocSize(
                                        context: context) *
                                        3,
                                    width: SizeConfig.getDynamicBlocSize(
                                        context: context) *
                                        3),
                                SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                                Rating(rating: state.pickedUser.reviews![0].reviewRating),
                                SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                                SizedBox(
                                  width: SizeConfig.getDynamicBlocSize(context: context)*20,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          textScaler: TextScaler.linear((textScaler??1)),
                                          state.pickedUser.reviews![0].reviewMessage, style: currentTheme.textTheme.bodyMedium?.copyWith(
                                            color: AppColors.cardLabelColor
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
                        }
                        return  BigWhiteCard(
                          tabContent: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AssetAccessor.drawImage(
                                  fit: BoxFit.contain,
                                  imageName: state.pickedUser.reviews![index].reviewImage,
                                  height: SizeConfig.getDynamicBlocSize(
                                      context: context) *
                                      3,
                                  width: SizeConfig.getDynamicBlocSize(
                                      context: context) *
                                      3),
                              SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                              Rating(rating: state.pickedUser.reviews![index].reviewRating),
                              SizedBox(height: SizeConfig.getDynamicBlocSize(context: context),),
                              SizedBox(
                                width: SizeConfig.getDynamicBlocSize(context: context)*20,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear((textScaler??1)),
                                        state.pickedUser.reviews![index].reviewMessage, style: currentTheme.textTheme.bodyMedium?.copyWith(
                                          color: AppColors.cardLabelColor
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                ),
              ],
            );
          }
          return MiniSectionWidget(
            hideBtn: true,
            themeData: currentTheme,
            scaleFactor: textScaler,
            title: 'Recent Reviews'.toUpperCase(),
            btnLabel: '--',
            iconName: AssetAccessor.emptyReviewIcon,
            iconTitle: 'No Recent Reviews to Show',
          );
        });
  }
}
class Rating extends StatelessWidget {
  final int rating;
  const Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        for(int i =0;i<=rating;i++)
        Padding(
            padding: EdgeInsets.only(right: SizeConfig.getDynamicBlocSize(context: context)),
            child: const Icon(Icons.star, color: Colors.amber,)),
        if(5-rating>0)
        for(int j=0; j<=(5-rating);j++)
          Padding(
              padding: EdgeInsets.only(right: SizeConfig.getDynamicBlocSize(context: context)),
              child:  Icon(Icons.star_outline_outlined, color: AppColors.cardLabelColor,)),

      ],);
  }
}
