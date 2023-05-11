import 'dart:ui';

import 'package:flutter/foundation.dart';

void main() {
  test();
}

/// Color 类的所有 Api 完整使用示例
void test() {
  // 方式1：使用16进制颜色值
  // #FFB5B5 粉红色 255 181 181
  Color color = const Color(0xFFB5B5);
  int red = color.red;
  int green = color.green;
  int blue = color.blue;
  if (kDebugMode) {
    print("color:     red: $red    green: $green    blue: $blue");
  } // red: 255    green: 181    blue: 181

  // 前两位为透明度：不透明度（00是完全透明，FF是完全不透明）
  Color color1 = Color(0xFFFFB5B5);
  int alpha1 = color1.alpha;
  int red1 = color1.red;
  int green1 = color1.green;
  int blue1 = color1.blue;
  if (kDebugMode) {
    print("color1:     alpha: $alpha1    red: $red1    green: $green1    blue: $blue1");
  } // alpha: 255    red: 255    green: 181    blue: 181

  // 方式2：  参数4为：不透明度（0是完全透明，255是完全不透明）
  Color color2 = const Color.fromARGB(255, 255, 181, 181);
  int alpha2 = color2.alpha;
  int red2 = color2.red;
  int green2 = color2.green;
  int blue2 = color2.blue;
  if (kDebugMode) {
    print("color2:     alpha: $alpha1    red: $red2    green: $green2    blue: $blue2");
  } // alpha: 255    red: 255    green: 181    blue: 181

  // 方式3： 参数4为：不透明度（0.0是完全透明，1.0是完全不透明）
  Color color3 = const Color.fromRGBO(255, 181, 181, 1.0);
  int red3 = color3.red;
  int green3 = color3.green;
  int blue3 = color3.blue;
  double opacity3 = color3.opacity;
  if (kDebugMode) {
    print("color3:     red: $red3    green: $green3    blue: $blue3    $opacity3");
  } //  red: 255    green: 181    blue: 181    1.0

  // 方式4： 参数3：从0.0到1.0
  // 算法：a + (b - a) * t
  // 从红色到蓝色，线性插值系数为0.5
  Color? color4 = Color.lerp(const Color(0x88FF0000),  const Color(0x880000FF), 0.5);
  int? alpha4 = color4?.alpha;
  int? red4 = color4?.red;
  int? green4 = color4?.green;
  int? blue4 = color4?.blue;
  double? opacity4 = color4?.opacity;
  if (kDebugMode) {
    print("color4:     alpha: $alpha4    red: $red4    green: $green4    blue: $blue4    opacity:$opacity4");
  } // alpha: 136    red: 127    green: 0    blue: 127    opacity:0.5333333333333333

  // 方式5：把前景色作为透明色盖在背景色上面
  Color color5 = Color.alphaBlend(new Color(0x88FF0000), new Color(0x880000FF));
  int alpha5 = color5.alpha;
  int red5 = color5.red;
  int green5 = color5.green;
  int blue5 = color5.blue;
  double? opacity5 = color4?.opacity;
  if (kDebugMode) {
    print("color5:     alpha: $alpha5    red: $red5    green: $green5    blue: $blue5    opacity:$opacity5");
  } // alpha: 199    red: 174    green: 0    blue: 80    opacity:0.5333333333333333

  // 颜色的亮度 0是最暗，1是最亮
  Color color6 = const Color(0x88FF0000);
  double computeLuminance = color.computeLuminance();
  if (kDebugMode) {
    print("color6: $computeLuminance");
  } // 0.5764394295278801

  // 替换掉原来颜色中的 alpha 值
  color6.withAlpha(100);
  // 替换掉原来颜色中的 red 值
  color6.withRed(100);
  // 替换掉原来颜色中的 green 值
  color6.withGreen(100);
  // 替换掉原来颜色中的 blue 值
  color6.withBlue(100);
  // 替换掉原来颜色中的 opacity 值
  color6.withOpacity(0.8);
  

}
