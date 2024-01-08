import 'package:flutter/material.dart';

import '../../Core/constants.dart';
class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.label,
    this.customWidth = double.infinity,
    this.textEditingController,
    required this.errorMessage,
    this.fieldIcon,
    this.keyboardType,
    this.hidePassword = false,
    this.wantError = true,
  });
  final String label;
  final double customWidth;
  final TextEditingController? textEditingController;
  final String errorMessage;
  final Icon? fieldIcon;
  final TextInputType? keyboardType;
  final bool hidePassword;
  final bool wantError;
  @override
  Widget build(BuildContext context) {
    double height=screenHeight(context);
    double width=screenWidth(context);
    return Material(
      elevation: 0,
      child: Container(
        height: height * 0.067,
        width: customWidth,
        decoration: BoxDecoration(
            color: themeColor,
            borderRadius:
            BorderRadius.all(Radius.circular(width * 0.025))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: TextFormField(
              keyboardType: keyboardType,
              controller: textEditingController,
              decoration: InputDecoration(
                icon: fieldIcon,
                contentPadding: EdgeInsets.only(left: width * 0.03),
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(
                  fontSize: width * 0.037,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return wantError ? errorMessage : null;
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}