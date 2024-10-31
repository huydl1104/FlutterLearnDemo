import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/view/small_info_tile.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/view/widgets/small_deposit_button.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/view/widgets/small_withdraw_button.dart';

class VerticalBalancePage extends StatelessWidget {
  const VerticalBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExpandablePageView(
            alignment: Alignment.centerLeft,
            scrollDirection: Axis.vertical,
            children: const [
              SmallInfoTile(
                icon: Icon(
                  Icons.euro,
                  size: 36,
                  color: Colors.white,
                ),
                text: '54,00',
              ),
              SmallInfoTile(
                icon: Icon(
                  Icons.currency_pound,
                  size: 36,
                  color: Colors.white,
                ),
                text: '4.457,00',
              ),
              SmallInfoTile(
                icon: Icon(
                  Icons.currency_bitcoin,
                  size: 36,
                  color: Colors.white,
                ),
                text: '14,1230044',
              ),
            ],
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                SmallDepositButton(),
                SizedBox(height: 12),
                SmallWithdrawButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
