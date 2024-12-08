import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdaptivePanelWidget extends StatefulWidget {
  final int numberOfColumns;
  final Widget? menuWidget;
  final bool leftPanExpanded;
  final Widget? leftPanelWidgetContent;
  final Widget centerPanelWidgetContent;
  final Widget? rightPanelWidgetContent;
  final Widget? topMenu;
  final GlobalKey? scaffoldKey;


  const AdaptivePanelWidget(
      {super.key,
        this.menuWidget,
        this.scaffoldKey,
        this.topMenu,
        this.leftPanelWidgetContent,
        required this.leftPanExpanded,
        required this.numberOfColumns,
        required this.centerPanelWidgetContent,
        this.rightPanelWidgetContent});

  @override
  State<AdaptivePanelWidget> createState() => _AdaptivePanelWidgetState();
}

class _AdaptivePanelWidgetState extends State<AdaptivePanelWidget> with SingleTickerProviderStateMixin{
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    animationController= AnimationController(vsync: this, duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 200)
    )..forward();
    animation = Tween<double>(begin: 0.1,end:8).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutExpo));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc,AppState>(
      listener: (context,state)async {
        if(state is PickUserState){
          await animationController.reverse();
        }else if (state is OpenedGuestBookState || state is LoadUsersDataSuccessState || state is LoadUsersDataLoadingState){
          await animationController.forward();
        }
      },
      child: Scaffold(
        drawer: widget.scaffoldKey!=null? Drawer(
          width:300,
          backgroundColor: AppColors.mainPrimaryBlack,
          child: const Column(),
        ):null,
        key: widget.scaffoldKey,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.numberOfColumns>1?
                  widget.menuWidget!:const SizedBox.shrink(),
                  widget.numberOfColumns>1?
                  AnimatedBuilder(
                      animation: animation,
                      child: widget.leftPanelWidgetContent!,
                      builder: (context,child,) {
                        return SizedBox(
                          width: (MediaQuery.sizeOf(context).width/22)*animation.value,
                          child: Transform.scale(
                              alignment: Alignment.centerLeft,
                              origin: Offset.zero,
                              scaleX: animation.value/8,
                              scaleY: 1,
                              child: child!),
                        );
                      }
                  )
                      :const SizedBox.shrink(),
                  widget.numberOfColumns>1?
                  VerticalDivider(color: AppColors.cardSecondaryLabelColor):const SizedBox.shrink(),
                  Expanded(
                      flex: 14,
                      child: widget.centerPanelWidgetContent),

                  widget.numberOfColumns>2?
                  VerticalDivider(color: AppColors.cardSecondaryLabelColor):const SizedBox.shrink(),
                  widget.numberOfColumns>2?
                  Expanded(
                    flex: 8,
                    child: widget.leftPanelWidgetContent!,
                  ):const SizedBox.shrink()
                ],
              ),
              widget.topMenu!=null?
              Positioned(
                top: 0,
                left: 0,
               // right: 0,
                //width: MediaQuery.sizeOf(context).width,
                child: widget.topMenu!,
              ):const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
