import 'package:flutter/material.dart';

/// 自定义可切换状态widget
/// @Author dwj
/// @Date 20230408
class BtnSelectWidget extends StatelessWidget {
  final String selectRes;
  final String unSelectRes;
  final bool showSelect;
  final double width;
  final double height;
  final GestureTapCallback? onTap;
  final Color colors;

  const BtnSelectWidget(
      {required this.selectRes,
      required this.unSelectRes,
      this.showSelect = false,
      this.width = 24,
      this.height = 24,
      this.onTap,
      this.colors = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image(
        image: showSelect ? AssetImage(selectRes) : AssetImage(unSelectRes),
        width: width,
        height: height,
        color: colors,
      ),
      onTap: onTap,
    );
  }
}
