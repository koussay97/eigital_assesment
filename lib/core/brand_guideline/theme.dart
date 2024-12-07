import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData currentTheme({required BuildContext context, double? textScaler}) {
    return ThemeData(
      useMaterial3: true,

        colorScheme: ColorScheme(

            brightness: Brightness.light,
            primary: AppColors.mainPrimaryBlack,
            onPrimary: AppColors.cardsHighlightColor,
            secondary: AppColors.cardsHighlightColor,
            onSecondary: AppColors.cardLabelColor,
            error: Colors.redAccent,
            onError: AppColors.cardsHighlightColor,
            surface: AppColors.mainBackground,
            onSurface: AppColors.cardsHighlightColor),
        canvasColor: AppColors.mainBackground,
        cardColor: AppColors.cardsHighlightColor,
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getDynamicBlocSize(context: context) * 2,
              vertical: SizeConfig.getDynamicBlocSize(context: context) * 1.5),
          buttonColor: AppColors.mainPrimaryBlack,
          textTheme: ButtonTextTheme.accent,
        ),

        // considering the design: the bloc size would be around 13.6 pixels
        textTheme: TextTheme(

          ///// styling body text : we have 2 variants : the main dark text and the social rating cards
          // 14 px medium
          bodyMedium: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.getDynamicBlocSize(context: context)*(textScaler??1),
              color: AppColors.cardLabelColor),
          // 16 px : regular
          bodyLarge: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.getDynamicBlocSize(context: context) * 1.17*(textScaler??1),
              color: AppColors.mainBodyColor),
          // 12 px : medium
          bodySmall: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.getDynamicBlocSize(context: context) * .9*(textScaler??1),
              color: AppColors.mainPrimaryBlack),

          //////// styling button texts and some cards texts :
          /// 12 medium : 500
          labelSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.getDynamicBlocSize(context: context) * .9*(textScaler??1),
            color: AppColors.cardsHighlightColor,
          ),

          /// 14 medium: 500
          labelMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*(textScaler??1),
            color: AppColors.cardLabelColor,
          ),
          /// 14 semiBold
          labelLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*(textScaler??1),
            color: AppColors.mainPrimaryBlack,
          ),

          ///// styling headlines
          /// 22 medium
          headlineLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*1.61*(textScaler??1),
            color: AppColors.mainPrimaryBlack,
          ),
          // 16 : semiBold
          headlineMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*1.17*(textScaler??1),
            color: AppColors.mainPrimaryBlack,
          ),
          // 16 : medium
          headlineSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*1.17*(textScaler??1),
            color: AppColors.cardLabelColor,
          ),

            ///// styling the upper black bar texts
          /// 21 bold
          displayLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*1.53*(textScaler??1),
            color: AppColors.cardsHighlightColor,
          ),

          /// 18 semiBold
          displayMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.getDynamicBlocSize(context: context)*1.31*(textScaler??1),
            color: AppColors.cardsHighlightColor,
          ),

        ));
  }
}
