import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';
class ApplicationBar extends StatelessWidget {
  final VoidCallback? onTapMenuBtn;
  final double? textScaler;
  final double height;
  const ApplicationBar({super.key, required this.height,this.textScaler, this.onTapMenuBtn});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    return Material(
     color: Colors.transparent,
      elevation: 2,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getDynamicBlocSize(context: context)),
                    height: height,
                   width: double.infinity,
                   color: AppColors.mainPrimaryBlack,
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           GestureDetector(
                               onTap:onTapMenuBtn,
                               child: Icon(Icons.menu,color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*3*(textScaler??1),)),
                           SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                           Icon(Icons.compare_arrows, color: AppColors.cardsHighlightColor,),
                           SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                           Container(
                             width: height*.8,
                             height: height*.8,
                             decoration: BoxDecoration(
                                 boxShadow: [BoxShadow(color: Colors.white60.withOpacity(0.3))],
                                 shape: BoxShape.circle,
                                 image: DecorationImage(image: AssetImage(AssetAccessor.imageMainProfile))
                             ),
                           ),
                           SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                           Text('Johnson Francisco',style: currentTheme.textTheme.displayLarge?.copyWith(color: AppColors.cardsHighlightColor),textScaler: TextScaler.linear(textScaler??1)),
                           SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                           Text('Clocked in at:',style: currentTheme.textTheme.displayMedium?.copyWith(color: AppColors.cardsHighlightColor),textScaler: TextScaler.linear(textScaler??1)),
                           Text('09:33 AM',style: currentTheme.textTheme.displayMedium?.copyWith(color: AppColors.cardsHighlightColor),textScaler: TextScaler.linear(textScaler??1)),

                         ],
                       ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(getFormattedTime(DateTime.now()),style: currentTheme.textTheme.displayLarge?.copyWith(color: AppColors.cardsHighlightColor),textScaler: TextScaler.linear(textScaler??1)),
                            SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                            Icon(Icons.network_wifi_sharp, color: AppColors.cardsHighlightColor, size: SizeConfig.getDynamicBlocSize(context: context)*3,),
                            SizedBox(width: SizeConfig.getDynamicBlocSize(context: context),),
                            Icon(Icons.notifications_none, color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*3,),
                          ],
                        ),
                      )
                     ],
                   ),

                  ),
                  Positioned(
                      bottom: -10,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: height*0.5,
                        width: height*2,
                        decoration: BoxDecoration(
                          color: AppColors.mainPrimaryBlack,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Icon(Icons.keyboard_arrow_down, color: AppColors.cardsHighlightColor,),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
String getFormattedTime(DateTime time) {
  String dayPortion= 'AM';
  int auxHourTime = time.hour;
  int auxMinute = time.minute;
  if(time.hour>12){
    dayPortion='PM';
    auxHourTime= time.hour-12;
  }
  return '${auxHourTime.toString().padLeft(2,'0')} : ${auxMinute.toString().padLeft(2,'0')} $dayPortion';
}