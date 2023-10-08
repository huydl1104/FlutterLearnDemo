
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_application/expandablePageView/page/view/available_balance_tile.dart';
import 'package:flutter_demo_application/expandablePageView/page/view/cards_tile.dart';
import 'package:flutter_demo_application/expandablePageView/page/view/contacts_tile.dart';

import 'view/widgets/hide_cards_button.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpandablePageView(
            children: const [
              AvailableBalanceTile(),
              CardsTile(),
              ContactsTile(),
            ],
          ),
          const HideCardsButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
