import 'package:eigital_assessment/core/brand_guideline/constant_colors.dart';
import 'package:eigital_assessment/core/responsive_layout/size_config.dart';
import 'package:eigital_assessment/domain/user_model.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/bottom_cards_over_view_card.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/data_key_value_vertical_atom.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/four_section_inner_card_Molecule.dart';
import 'package:eigital_assessment/widgets/center_panel_widgets/tab_view_widgets/inner_card_molecule.dart';
import 'package:flutter/material.dart';

class TabViewMidSectionLowerCards extends StatelessWidget {
  final ThemeData theme;
  final double? scaleFactor;
  final UserClass userModel;

  const TabViewMidSectionLowerCards(
      {super.key,
      required this.userModel,
      required this.theme,
      this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 16,
            child: InnerCard(
              child: OverViewCardContent(
                data: [
                  {'Loyalty NO': userModel.loyaltyNo},
                  {'Customer Since': userModel.customerSince},
                  {'Birth Date': userModel.birthday},
                  {'Anniversary': userModel.anniversary},
                ],
                theme: theme,
                scaleFactor: scaleFactor,
              ),
            )),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 11,
            child: FourSectionCard(
              lastIsCurrency: true,
              data: [
                {'Earned': userModel.loyaltyPointsEarned.toDouble()},
                {'Redeemed': userModel.loyaltyPointsRedeemed.toDouble()},
                {'Available': userModel.loyaltyPointsAvailable.toDouble()},
                {'Amount': userModel.loyaltyAmount.toDouble()},
              ],
              scaleFactor: scaleFactor,
              theme: theme,
              title: 'Visits',
            ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox.shrink(),
        ),
        Expanded(
            flex: 11,
            child: FourSectionCard(
              lastIsCurrency: false,
              data: [
                {'Total': userModel.totalVisits.toDouble()},
                {'Upcoming': userModel.upcomingVisits.toDouble()},
                {'Canceled': userModel.canceledVisits.toDouble()},
                {'No show': userModel.noShowVisits.toDouble()},
              ],
              scaleFactor: scaleFactor,
              theme: theme,
              title: 'LOYALTY',
            ),
        )
      ],
    );
  }
}


