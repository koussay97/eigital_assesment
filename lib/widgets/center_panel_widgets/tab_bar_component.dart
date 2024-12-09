import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/brand_guideline.dart';
import 'package:eigital_assessment/core/responsive_layout/responsive_componenet.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/bottom_cards.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/bottom_cards_wrapper.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/custom_vertical_divider_atom.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/inner_card_molecule.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/top_expanded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TabBarComponent extends StatefulWidget {
  final double? scaleFactor;

  const TabBarComponent({super.key, this.scaleFactor});

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  late int tabIndex;

  @override
  void initState() {
    tabIndex = 0;
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
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
        BlocBuilder<AppBloc, AppState>(
            buildWhen: (prevState, currentState) =>
                currentState is LoadUsersDataLoadingState ||
                currentState is LoadUsersDataSuccessState ||
                currentState is PickUserState ||
                currentState is OpenedGuestBookState,
            builder: (context, state) {
              if (state is LoadUsersDataLoadingState || state is AppInitial) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: SizedBox(
                      height: SizeConfig.getDynamicBlocSize(context: context) * 40,
                      child: const BigWhiteCard()),
                );
              }

              if (state is PickUserState) {
                return SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context) * 30,
                  child: TabBarView(controller: tabController, children: [
                    BigWhiteCard(
                      tabContent: ProfileTabViewItem(
                        userModel: state.pickedUser,
                        showRightPortion: true,
                        fill: true,
                        currentTheme: currentTheme,
                        scaleFactor: widget.scaleFactor,
                      ),
                    ),
                    BigWhiteCard(
                      tabContent: Center(
                        child: Text('${tabs[tabIndex]}'),
                      ),
                    ),
                    BigWhiteCard(
                      tabContent: Center(
                        child: Text('${tabs[tabIndex]}'),
                      ),
                    ),
                    BigWhiteCard(
                      tabContent: Center(
                        child: Text('${tabs[tabIndex]}'),
                      ),
                    ),
                    BigWhiteCard(
                      tabContent: Center(
                        child: Text('${tabs[tabIndex]}'),
                      ),
                    ),
                  ]),
                );
              }
              return SizedBox(
                height: SizeConfig.getDynamicBlocSize(context: context) * 40,
                child: TabBarView(controller: tabController, children: [
                  BigWhiteCard(
                    tabContent: ProfileTabViewItem(
                      userModel: state.users.firstWhere(
                          (e) => e.id == context.read<AppBloc>().lastSelectedId,
                          orElse: () => state.users[0]),
                      showRightPortion: false,
                      fill: true,
                      currentTheme: currentTheme,
                      scaleFactor: widget.scaleFactor,
                    ),
                  ),
                  BigWhiteCard(
                    tabContent: Center(
                      child: Text('${tabs[tabIndex]}'),
                    ),
                  ),
                  BigWhiteCard(
                    tabContent: Center(
                      child: Text('${tabs[tabIndex]}'),
                    ),
                  ),
                  BigWhiteCard(
                    tabContent: Center(
                      child: Text('${tabs[tabIndex]}'),
                    ),
                  ),
                  BigWhiteCard(
                    tabContent: Center(
                      child: Text('${tabs[tabIndex]}'),
                    ),
                  ),
                ]),
              );
            }),
      ],
    );
  }
}

class BigWhiteCard extends StatelessWidget {
  final Widget? tabContent;

  const BigWhiteCard({super.key, this.tabContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AssetAccessor.appPadding(context: context)),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AssetAccessor.cardRadius(context: context)),
        color: AppColors.cardsHighlightColor,
      ),
      child: tabContent,
    );
  }
}

class ProfileTabViewItem extends StatelessWidget {
  final UserClass userModel;
  final ThemeData currentTheme;
  final bool fill;
  final bool showRightPortion;
  final double? scaleFactor;

  const ProfileTabViewItem(
      {super.key,
      required this.userModel,
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
                    color: userModel.image == null
                        ? AppColors.cardLabelColor
                        : null,
                    image: userModel.image != null
                        ? DecorationImage(image: AssetImage(userModel.image!))
                        : null,
                  ),
                  child: userModel.image == null
                      ? Center(
                          child: Text(
                          '${userModel.name.substring(0, 2).toUpperCase()}',
                          style: currentTheme.textTheme.bodySmall
                              ?.copyWith(color: AppColors.cardsHighlightColor),
                        ))
                      : null,
                ),
                Text(
                  textAlign: TextAlign.center,
                  userModel.name,
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
                    userModel.email,
                    style: currentTheme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.mainPrimaryBlack),
                    overflow: TextOverflow.ellipsis),
                Text(
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear((scaleFactor ?? 1)),
                  userModel.phoneNumber,
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
          height: SizeConfig.getDynamicBlocSize(context: context) * 25,
          color: AppColors.cardSecondaryLabelColor,
          thickness: 1,
        ),
        SizedBox(
          width: SizeConfig.getDynamicBlocSize(context: context) * 2,
        ),
        Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TabViewMidSectionUpperCard(
                  data: [
                    {'Last Visit': userModel.lastVisit},
                    {'Average Spent': userModel.averageSpent},
                    {'Lifetime Spent': userModel.lifetimeSpent},
                    {'Total Orders': userModel.totalOrders},
                    {'Average Tip': userModel.averageTip},
                  ],
                  theme: currentTheme,
                  scaleFactor: scaleFactor,
                ),
                SizedBox(
                  height: SizeConfig.getDynamicBlocSize(context: context) * 2,
                ),
                TabViewMidSectionLowerCards(
                  userModel: userModel,
                  theme: currentTheme,
                  scaleFactor: scaleFactor,
                ),
                (!showRightPortion)
                    ? BottomCards(currentTheme: currentTheme,scaleFactor:scaleFactor,)
                    : const SizedBox.shrink(),
              ],
            )),
        showRightPortion
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        SizeConfig.getDynamicBlocSize(context: context) * 2),
                child: CustomVerticalDivider(
                  height: SizeConfig.getDynamicBlocSize(context: context) * 25,
                  color: AppColors.cardSecondaryLabelColor,
                  thickness: 1,
                ),
              )
            : const SizedBox.shrink(),
        showRightPortion
            ? Expanded(flex: 3, child: OtherCards(currentTheme: currentTheme,scaleFactor: scaleFactor,))
            : const SizedBox.shrink(),
      ],
    );
  }
}
