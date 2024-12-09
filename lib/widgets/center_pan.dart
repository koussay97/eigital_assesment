import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/guest_book_card.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_bar_component.dart';
import 'package:eigital_assessment/widgets/mini_sctionCard_widget.dart';
import 'package:flutter/material.dart';

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

            SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),
            MiniSectionWidget(
              themeData: currentTheme,
              scaleFactor: textScaler,
              title: 'Allergy',btnLabel: 'Add',iconName: AssetAccessor.storeIcon,iconTitle: 'No Allergies',),
            SizedBox(height: SizeConfig.getDynamicBlocSize(context: context)*2,),
            MiniSectionWidget(
              themeData: currentTheme,
              scaleFactor: textScaler,
              title: 'Upcoming Visits',btnLabel: 'Book A Visit',iconName: AssetAccessor.forkKnifeIcon,iconTitle: 'No Upcoming Visits',),

          ],
        ),
      ),
    );
  }
}


