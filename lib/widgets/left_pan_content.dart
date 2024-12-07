import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';


//////////// mock data class
class UserClass {
  final String email;
  final String phoneNumber;
  final String? image;
  final String name;

  UserClass(
      {required this.email,
      required this.name,
      required this.phoneNumber,
      this.image});
}

List<UserClass> users = [
  UserClass(
      email: 'lia.thomas516@reddit.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Lia Thomas',
      image: AssetAccessor.imageLea),
  UserClass(
      email: 'cleorahills@gmail.com',
      phoneNumber: '+1 212-450-7890',
      name: 'Bergnaum',
      image: AssetAccessor.imageBergnaum),
  UserClass(
      email: 'wunder@gmail.com',
      phoneNumber: '+1 212-236-7890',
      name: 'Wunderlich',
      image: AssetAccessor.imageWunder),
  UserClass(
      email: 'alaskanm@dog.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Arjun Gerhold'),
  UserClass(
      email: 'simeon@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Simeon Wilderman'),
  UserClass(
      email: 'edenka@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Eden Kautzer',
      image: AssetAccessor.imageEden),
  UserClass(
    email: 'gyostt@Test.com',
    phoneNumber: '+1 212-456-7890',
    name: 'Gino Yost',
  ),
  UserClass(
      email: 'aydeveu@synd.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Ayden Veum',
      image: AssetAccessor.imageAyden),
  UserClass(
      email: 'edenka@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Eden Kautzer',
      image: AssetAccessor.imageEden),
];

//////////// screen
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
               flex: 1,
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                 Expanded(
                   flex: 10,
                   child: Container(
                     padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
                     decoration: BoxDecoration(
                       color: AppColors.mainPrimaryBlack,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Icon(Icons.add, color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*2),
                   ),
                 ),
                   const Expanded(flex: 1,child: SizedBox(width: 10,),),
                   Expanded(
                       flex: 10,
                   child: Container(
                     padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),

                     decoration: BoxDecoration(
                       color: AppColors.cardLabelColor,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Icon(Icons.archive_outlined, color: AppColors.cardsHighlightColor,size: SizeConfig.getDynamicBlocSize(context: context)*2),
                   ),)

                 ],),
             ),
                Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
                      decoration: BoxDecoration(
                        color: AppColors.cardSecondaryLabelColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.sort_by_alpha, color: AppColors.mainPrimaryBlack,size: SizeConfig.getDynamicBlocSize(context: context)*2,),
                    ),)
            ],),

            SizedBox(
              height: SizeConfig.getDynamicBlocSize(context: context) * 2,
            ),
            ListView.separated(
             physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomListTile(theme: currentTheme,user: users[index], scaleFactor: textScaler,);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.cardSecondaryLabelColor,
                  );
                },
                itemCount: users.length)
          ],
        ),
      ),
    );
  }
}


/// tile widget
class CustomListTile extends StatelessWidget {
  final UserClass user;
  final ThemeData theme;
  final double? scaleFactor;
  const CustomListTile({super.key, required this.user, required this.theme, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 3,
            child: Container(
              width: SizeConfig.getDynamicBlocSize(context: context)*5*(scaleFactor??1),
              height: SizeConfig.getDynamicBlocSize(context: context)*5*(scaleFactor??1),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.white60.withOpacity(0.3))],
                shape: BoxShape.circle,
                color: user.image == null ? AppColors.cardLabelColor : null,
                image: user.image != null
                    ? DecorationImage(image: AssetImage(user.image!))
                    : null,
              ),
              child: user.image != null ?null:Center(child: Text('${user.name.substring(0,1).toUpperCase()}', style: theme.textTheme.headlineSmall?.copyWith(color: AppColors.cardsHighlightColor),)),
            )),
        Expanded(
            flex: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  textScaler: TextScaler.linear((scaleFactor??1)),
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context)*.6,
                ),
                Text(
                    textScaler: TextScaler.linear((scaleFactor??1)),
                    user.email,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: AppColors.mainPrimaryBlack),
                    overflow: TextOverflow.ellipsis),
                Text(
                  textScaler: TextScaler.linear((scaleFactor??1)),
                  user.phoneNumber,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ))
      ],
    );
  }
}
