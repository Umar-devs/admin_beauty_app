import 'package:admin_beauty_app/View/Pages/Orders%20Report%20Screen/data.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/custom_btn.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_txt_field.dart';
import 'package:flutter/material.dart';
import '../../../Core/constants.dart';
import '../../Reusable Components/reusable_text.dart';
import 'package:get/get.dart';

class OrdersReportScreen extends StatelessWidget {
  const OrdersReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = screenHeight(context);
    return SafeArea(
        child: Container(
      height: height,
      width: width,
      color: themeLightColor,
      padding: EdgeInsets.only(
          left: width * 0.08, right: width * 0.08, top: height * 0.015),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (int i = 0; i < 4; i++)
              i.isEven
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.01),
                        child: ReusableText(
                            weight: FontWeight.w600,
                            fontSize: width * 0.035,
                            lbl: i == 0 ? 'Start Date' : 'End Date'),
                      ),
                    )
                  : TxtField(
                      bottomPad: height * 0.015,
                      keyboardType: TextInputType.number,
                      label: 'hint:(year,month,day)',
                      errorMessage: 'This Field is Empty'),
            CustomBtn(
              onTap: () {},
              height: height,
              width: width,
              title: 'Calculate',
              btnHeight: height * 0.05,
              btnWidth: width * 0.6,
              fontSizeTitle: width * 0.038,
              topPad: height * 0.01,
            ),
            Container(
              height: height * 0.32,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              margin:
                  EdgeInsets.only(top: height * 0.035, bottom: height * 0.035),
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableText(
                      weight: FontWeight.w600,
                      fontSize: width * 0.04,
                      lbl: 'Results'),
                  Divider(
                    color: Colors.black54,
                    indent: width * 0.05,
                    endIndent: width * 0.05,
                  ),
                  for (int i = 0; i < reportHeadings.length; i++)
                    i.isEven
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  weight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                  lbl: reportHeadings[i]),
                              ReusableText(
                                  weight: FontWeight.w500,
                                  fontSize: width * 0.03,
                                  lbl: demoDetails[i])
                            ],
                          )
                        : const Divider(
                            color: Colors.black12,
                          )
                ],
              ),
            ),
            CustomBtn(
              onTap: () {},
              height: height,
              width: width,
              title: 'Clear',
              btnHeight: height * 0.05,
              btnWidth: width * 0.6,
              fontSizeTitle: width * 0.038,
              bottomPad: height * 0.045,
            ),
          ],
        ),
      ),
    ));
  }
}
