import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/widgets/left_pan_content.dart';
import 'package:flutter/material.dart';

class TabBarComponent extends StatefulWidget {
  final double? scaleFactor;

  const TabBarComponent({super.key, this.scaleFactor});

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  static List<String> tabs = [
    "Profile",
    "Reservation",
    "Payment",
    "FeedBack",
    "Order History"
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  AssetAccessor.cardRadius(context: context))),
          child: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            isScrollable: true,
            unselectedLabelColor: AppColors.mainPrimaryBlack,
            splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
            //splashFactory: InkSplash.splashFactory,
            automaticIndicatorColorAdjustment: false,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: currentTheme.textTheme.headlineMedium
                ?.copyWith(color: AppColors.cardsHighlightColor),
            controller: tabController,
            labelPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getDynamicBlocSize(context: context)),
            unselectedLabelStyle: currentTheme.textTheme.headlineSmall
                ?.copyWith(color: AppColors.mainPrimaryBlack),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            dividerHeight: 0,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardLabelColor),
            tabs: [
              ...tabs.map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    e,
                    textScaler: TextScaler.linear((widget.scaleFactor ?? 1)),
                  )))
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
         // height: SizeConfig.getDynamicBlocSize(context: context) * 40,
          padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                AssetAccessor.cardRadius(context: context)),
            color: AppColors.cardsHighlightColor,
          ),
          child: TabViewItem(
            showRightPortion: false,
            fill: true,
            currentTheme: currentTheme,
            scaleFactor: widget.scaleFactor,
          ),
        ),
      ],
    );
  }
}

class TabViewItem extends StatelessWidget {
  final ThemeData currentTheme;
  final bool fill;
  final bool showRightPortion;
  final double? scaleFactor;

  const TabViewItem(
      {super.key,
      required this.fill,
      this.scaleFactor,
      required this.currentTheme,
      required this.showRightPortion});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: !showRightPortion ? 3 : 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig.getDynamicBlocSize(context: context) * 4,
                  height: SizeConfig.getDynamicBlocSize(context: context) * 4,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.white60.withOpacity(0.3))
                      ],
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage(users[0].image!))),
                ),
                Text(
                  textAlign: TextAlign.center,
                  users[0].name,
                  textScaler: TextScaler.linear((scaleFactor ?? 1)),
                  style: currentTheme.textTheme.headlineMedium
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context) * .6,
                ),
                Text(
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear((scaleFactor ?? 1)),
                    users[0].email,
                    style: currentTheme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.mainPrimaryBlack),
                    overflow: TextOverflow.ellipsis),
                Text(
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear((scaleFactor ?? 1)),
                  users[0].phoneNumber,
                  style: currentTheme.textTheme.labelSmall
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context) * .6,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.mainPrimaryBlack),
                        foregroundColor:
                            WidgetStatePropertyAll(AppColors.mainPrimaryBlack)),
                    onPressed: () {},
                    child: Text(
                      'Add Tags',
                      style: currentTheme.textTheme.labelMedium
                          ?.copyWith(color: AppColors.cardsHighlightColor),
                    ))
              ],
            )),
        CustomVerticalDivider(
          height: SizeConfig.getDynamicBlocSize(context: context)*25,
          color:AppColors.cardSecondaryLabelColor ,thickness: 1,),
         SizedBox(width: SizeConfig.getDynamicBlocSize(context: context)*2,),
        Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TabViewMidSectionUpperCard(
                  theme: currentTheme,
                  scaleFactor: scaleFactor,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context),
                ),
                 TabViewMidSectionLowerCards(
                  theme: currentTheme,
                   scaleFactor: scaleFactor,
                )
              ],
            )),
        showRightPortion
            ? CustomVerticalDivider(
          height: SizeConfig.getDynamicBlocSize(context: context)*25,
          color:AppColors.cardSecondaryLabelColor ,thickness: 1,)

            : const SizedBox.shrink(),
        showRightPortion
            ? Expanded(flex: 3, child: Container())
            : const SizedBox.shrink(),
      ],
    );
  }
}

class TabViewMidSectionLowerCards extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;
  const TabViewMidSectionLowerCards({super.key, required this.theme, this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 16,
            child: InnerCard(
              child: OverViewCardContent(
                theme: theme,
                scaleFactor: scaleFactor,
              ),
            )),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 11,
            child: Container(
                color: AppColors.mainBackground,
                height: SizeConfig.getDynamicBlocSize(context: context) * 4)),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 11,
            child: Container(
              color: AppColors.mainBackground,
              height: SizeConfig.getDynamicBlocSize(context: context) * 4,
            ))
      ],
    );
  }
}

// first bottom card
class OverViewCardContent extends StatelessWidget {
  final ThemeData theme;
 final double? scaleFactor;
  const OverViewCardContent({super.key, required this.theme, this.scaleFactor});

  static List<Map<String, dynamic>> data = [
    {'Loyalty NO': 'RF|'},
    {'Customer Since': DateTime( 2010,2, 10)},
    {'Birth Date': '--'},
    {'Anniversary': DateTime( 2003,11, 11)},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    textScaler:TextScaler.linear((scaleFactor??1)) ,
                    data[index].keys.first,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: AppColors.mainPrimaryBlack),
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  textScaler:TextScaler.linear((scaleFactor??1)) ,
                  data[index].values.first,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                )
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(overflow: TextOverflow.ellipsis,

                  textScaler:TextScaler.linear((scaleFactor??1)) ,
                  data[index].keys.first,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: AppColors.mainPrimaryBlack),
                ),
              ),
             Text(
               overflow: TextOverflow.ellipsis,
               textScaler:TextScaler.linear((scaleFactor??1)) ,
               (DateTime.tryParse(data[index].values.first.toString())==null? 'Enter':formatDate(date: data[index].values.first as DateTime)),
               style: theme.textTheme.labelMedium
                   ?.copyWith(color: AppColors.cardSecondaryLabelColor),
             )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: AppColors.cardSecondaryLabelColor,
          );
        },
        itemCount: data.length);
  }
}


class TabViewMidSectionUpperCard extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;

  const TabViewMidSectionUpperCard(
      {super.key, required this.theme, this.scaleFactor});

  static List<Map<String, dynamic>> data = [
    {'Last Visit': null},
    {'Average Spent': 0.0},
    {'Lifetime Spent': 0.0},
    {'Total Orders': 0.0},
    {'Average Tip': 0.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: SizeConfig.getDynamicBlocSize(context: context) * 7,
              padding: EdgeInsets.all(
                  SizeConfig.getDynamicBlocSize(context: context)),
              decoration: BoxDecoration(
                color: AppColors.cardsBackground,
                borderRadius: BorderRadius.circular(
                    AssetAccessor.cardRadius(context: context)),
              ),
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          SizeConfig.getDynamicBlocSize(context: context)),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    if (index == 0) {
                      return DataKeyValVertical(
                        showDivider: true,
                        theme: theme,
                        isCurrencyValue: false,
                        isDateTimeValue: true,
                        label: data[index].keys.first,
                        scaleFactor: scaleFactor,
                        lastVisit: data[index].values.first,
                      );
                    }

                    return DataKeyValVertical(
                      showDivider: true,
                      theme: theme,
                      isCurrencyValue: true,
                      isDateTimeValue: false,
                      label: data[index].keys.first,
                      scaleFactor: scaleFactor,
                      value: data[index].values.first,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == data.length - 1) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              SizeConfig.getDynamicBlocSize(context: context)),
                      child: VerticalDivider(
                        color: AppColors.cardSecondaryLabelColor,
                        width: 2,
                      ),
                    );
                  },
                  itemCount: 5)),
        ),
      ],
    );
  }
}

class InnerCard extends StatelessWidget {
  final Widget child;

  const InnerCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: SizeConfig.getDynamicBlocSize(context: context)*15),
      padding: EdgeInsets.all(SizeConfig.getDynamicBlocSize(context: context)),
      decoration: BoxDecoration(
        color: AppColors.cardsBackground,
        borderRadius:
            BorderRadius.circular(AssetAccessor.cardRadius(context: context)),
      ),
      child: Column(
        children: [
          Expanded(child: child),
        ],
      ),
    );
  }
}

class DataKeyValVertical extends StatelessWidget {
  final double? scaleFactor;
  final bool showDivider;
  final double? value;
  final String label;
  final bool isCurrencyValue;

  final bool isDateTimeValue;
  final ThemeData theme;
  final DateTime? lastVisit;

  const DataKeyValVertical({
    super.key,
    required this.showDivider,
    required this.isDateTimeValue,
    this.lastVisit,
    required this.theme,
    this.scaleFactor,
    required this.label,
    this.value,
    required this.isCurrencyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear((scaleFactor ?? 1)),
          '${isCurrencyValue ? '\$${value?.truncate()}.${((value?.remainder((value?.truncate() ?? 0)) ?? 0).isNaN ? 0 : value?.remainder((value?.truncate() ?? 0))).toString().padLeft(2, '0')}' : isDateTimeValue ? formatDate(date: lastVisit) : value?.round()}',
          style: theme.textTheme.headlineMedium
              ?.copyWith(color: AppColors.mainPrimaryBlack),
        ),
        SizedBox(
          height: SizeConfig.getDynamicBlocSize(context: context),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear((scaleFactor ?? 1)),
          label,
          style: theme.textTheme.labelSmall
              ?.copyWith(color: AppColors.mainPrimaryBlack),
        )
      ],
    );
  }
}

String formatDate({required DateTime? date}) {
  String formatted =
      '${date?.day ?? '--'} ${date?.month ?? '--'} ${date?.year ?? '--'}';
  return formatted;
}
class CustomVerticalDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double height;
  const CustomVerticalDivider({super.key,required this.height ,required this.color, required this.thickness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: thickness,
      color: color,
    );
  }
}
