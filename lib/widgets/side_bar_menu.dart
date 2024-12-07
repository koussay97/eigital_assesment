import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  final double width;
  final Color background;
  const SideBarMenu({super.key, required this.width, required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.t,
      padding: EdgeInsets.only(top: width),
      color: background,
      width: width,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.getDynamicBlocSize(context: context) * 4,
                  horizontal:
                      SizeConfig.getDynamicBlocSize(context: context) * 2),
              child: AssetAccessor.drawSvgIcon(
                  iconName: AssetAccessor.menuIcons[index],
                  height: SizeConfig.getDynamicBlocSize(context: context) * 4,
                  width: SizeConfig.getDynamicBlocSize(context: context) * 4,
                 ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(color: Colors.black,);
          },
          itemCount: AssetAccessor.menuIcons.length),
    );
  }
}
