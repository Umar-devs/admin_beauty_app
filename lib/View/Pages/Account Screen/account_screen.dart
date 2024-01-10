import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Pages/Account%20Screen/data.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/custom_btn.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return Container(
      height: height,
      width: width,
      color: themeLightColor,
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: height * 0.025),
      child: Column(
        children: [
          Image.asset('assets/images/profile.png'),
          SizedBox(
            height: height * 0.025,
          ),
          //i count number of Containers
          for (int i = 0; i < 3; i++)
            Container(
              height: height * 0.125,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              margin: EdgeInsets.only(bottom: height * 0.025),
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // j decides whether it's a row or divider within Container
                  for (int j = 0; j < 3; j++)
                    j.isEven
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  weight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                  lbl:
                                      /* (i is number of Container,
                                      j decides whether it is a row or a divider within the container)
                                      */

                                      // for first Container
                                      i == 0
                                          ? j == 0
                                              ? title[0]
                                              : title[1]
                                          // for second Container
                                          : i == 1
                                              ? j == 0
                                                  ? title[2]
                                                  : title[3]
                                              // for third Container
                                              : j == 0
                                                  ? title[4]
                                                  : title[5]),
                              Icon(
                                FontAwesomeIcons.pencil,
                                size: width * 0.037,
                                weight: 1,
                              )
                            ],
                          )
                        : const Divider(
                            color: Colors.black12,
                          ),
                ],
              ),
            ),
          CustomBtn(
            onTap: () {},
            height: height,
            width: width,
            title: 'Save Changes',
            btnHeight: height * 0.055,
            btnWidth: width * 0.5,
            fontSizeTitle: width * 0.035,
            topPad: height * 0.01,
          )
        ],
      ),
    );
  }
}
