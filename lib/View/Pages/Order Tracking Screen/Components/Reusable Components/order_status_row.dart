import 'package:admin_beauty_app/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Reusable Components/reusable_text.dart';

class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow(
      {super.key,
      required this.width,
      required this.status,
      required this.time,
      required this.icon,
      required this.backgroundColor,
      required this.height,
      this.track = false});
  final double width;
  final double height;
  final String status;
  final String time;
  final IconData icon;
  final Color backgroundColor;
  final bool track;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          Container(
              height: height * 0.055,
              width: width * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                  border: Border.all(color: Colors.black, width: 1)),
              child: Icon(icon)),
          SizedBox(
            width: width * 0.08,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: status,
                style: GoogleFonts.poppins(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            TextSpan(
                text: time,
                style: GoogleFonts.poppins(
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ])),
          const Spacer(),
          track == true
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: height * 0.037,
                    width: width * 0.172,
                    margin: EdgeInsets.only(left: width * 0.05),
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: ReusableText(
                          weight: FontWeight.w600,
                          fontSize: width * 0.035,
                          lbl: 'Track'),
                    ),
                  ),
                )
              : const Text('')
        ],
      ),
    );
  }
}
