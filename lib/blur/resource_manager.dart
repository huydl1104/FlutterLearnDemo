import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageHelper {
  static String wrapAssets(String url, {String format = 'png'}) {
    return "images/$url.$format";
  }
  static String wrapWebpAssets(String url) {
    return "images/$url.webp";
  }

  static String wrapAssetsLottie(String url, {String format = "zip"}) {
    return "lottie/$url.$format";
  }

  static Widget placeHolder({required double width, required double height}) {
    return SizedBox(
        width: width,
        height: height,
        child: CupertinoActivityIndicator(radius: min(10.0, width / 3)));
  }

  static Widget getDivider() {
    return const Divider(
      color: Color(0xB3CBC3B4),
      thickness: 0.5,
      height: 1,
      indent: 15,
      endIndent: 22,
    );
  }

  static Widget error(
      {required double width, required double height, required double size}) {
    return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.error_outline,
          size: size,
        ));
  }


  static Widget loadingHolder(){
    return Center(
      child: Lottie.asset(
        ImageHelper.wrapAssetsLottie("common_loading"),
        height: 40,
        width: 40,
      ),
    );
  }

}
