import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:flutter/material.dart';

import '../../Core/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.onTap,
      required this.height,
      required this.width,
      required this.title,
      required this.btnHeight,
      required this.btnWidth,
      this.topPad = 0,
      this.bottomPad = 0,
      this.leftPad = 0,
      this.rightPad = 0, required this.fontSizeTitle});
  final VoidCallback onTap;
  final double height;
  final double width;
  final double btnHeight;
  final double btnWidth;
  final double topPad;
  final double bottomPad;
  final double leftPad;
  final double rightPad;
  final double fontSizeTitle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight,
        width: btnWidth,
        margin: EdgeInsets.only(
            top: topPad, bottom: bottomPad, right: rightPad, left: leftPad),
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: ReusableText(
              weight: FontWeight.w600, fontSize: fontSizeTitle, lbl: title),
        ),
      ),
    );
  }
}
