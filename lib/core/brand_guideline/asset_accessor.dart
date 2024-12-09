import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class AssetAccessor {

  static String firstMenuIcon = 'assets/icons/menuIcon1.svg';
  static String secondMenuIcon = 'assets/icons/menuIcon2.svg';
  static String thirdMenuIcon = 'assets/icons/menuIcon3.svg';
  static String fourthMenuIcon = 'assets/icons/menuIcon4.svg';
  static String fifthMenuIcon = 'assets/icons/menuIcon5.svg';
  static String sixthMenuIcon = 'assets/icons/menuIcon6.svg';
  static String seventhMenuIcon = 'assets/icons/menuIcon7.svg';

  static List<String>menuIcons = [
    firstMenuIcon,
    secondMenuIcon,
    thirdMenuIcon,
    fourthMenuIcon,
    fifthMenuIcon,
    sixthMenuIcon,
    seventhMenuIcon
  ];

  /// mostly used icons
  static String forkKnifeIcon = 'assets/icons/0forkKnife.svg';
  static String guestBookIcon = 'assets/icons/0guestBook.svg';
  static String pieIcon = 'assets/icons/0pieIcon.svg';
  static String emptyReviewIcon = 'assets/icons/0reviewEmptyIcom.svg';
  static String storeIcon = 'assets/icons/0StoreIcon.svg';
  static String spoonKnifeIcon = 'assets/icons/0spoonKnife.svg';

  /// notes icons
  static String noteGeneral = 'assets/icons/notes_icons/notesGeneral.svg';
  static String noteSpecialRelation = 'assets/icons/notes_icons/notesRelation.svg';
  static String noteSeatingPrefs = 'assets/icons/notes_icons/notesSeatingPrefs.svg';
  static String noteSpecial = 'assets/icons/notes_icons/notesSpecial.svg';
  static String noteAllergy = 'assets/icons/notes_icons/notesAllergy.svg';
  static List<String> notesIcons =[
    noteGeneral,
    noteSpecialRelation,
    noteSeatingPrefs,
    noteSpecial,
    noteAllergy
  ];

  /// social icons and images ::
  static String socialGoogleSvgIcon='assets/icons/social_icons/socialGoogle.svg';
  static String socialBrustImage='assets/icons/social_icons/socialBrust.png';
  static String socialFourSquareImage='assets/icons/social_icons/socialFourSquare.png';
  static String socialZagatImage='assets/icons/social_icons/socialZagat.png';

  /// mock profile images
  static String imageMainProfile = 'assets/mock_profile_images/mainProfileimage.png';
  static String imageAyden = 'assets/mock_profile_images/ayden.png';
  static String imageEden = 'assets/mock_profile_images/eden.png';
  static String imageBergnaum = 'assets/mock_profile_images/bergnaum.png';
  static String imageLea = 'assets/mock_profile_images/Lea.png';
  static String imageWunder = 'assets/mock_profile_images/wunder.png';


  static SvgPicture drawSvgIcon({
    Color? color,
    required String iconName,
    required double height,
    required double width}) =>
      SvgPicture.asset(
        iconName,
        colorFilter: color==null? null:ColorFilter.mode(color, BlendMode.color),
        height: height,
        width: width,
      );

  static Image drawImage({
    required String imageName,
     double? height,
     double? width,
     BoxFit? fit
  }) {
    return Image.asset(imageName, height: height, width: width, fit: fit,);
  }
  
  static double appPadding({required BuildContext context})=> SizeConfig.getDynamicBlocSize(context: context)*2;
  static double cardRadius({required BuildContext context}) => 15.0;
}
