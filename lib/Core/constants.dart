import 'package:flutter/material.dart';

Color themeColor = const Color(0xffebc1a9).withOpacity(0.5);
Color themeLightColor = const Color(0xfffcf4f7);
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
