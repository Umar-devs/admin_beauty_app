import 'package:flutter/material.dart';
import '../../../../../Core/constants.dart';
import '../../../../Reusable Components/reusable_text.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.073,
        vertical: screenHeight*0.05
      ),
      height: screenHeight * 0.067,
      width: screenWidth,
      decoration: BoxDecoration(
          color: themeColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: ReusableText(
        weight: FontWeight.w600,
        fontSize: screenWidth * 0.04,
        lbl: 'Login',
        clr: Colors.black,
      )),
    );
  }
}
