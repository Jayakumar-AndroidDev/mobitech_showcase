import 'package:flutter/widgets.dart';

class AppUtil {
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static Widget heightSpace(double space) => SizedBox(height:  space);
  static Widget widthSpace(double space) => SizedBox(width:  space);
}