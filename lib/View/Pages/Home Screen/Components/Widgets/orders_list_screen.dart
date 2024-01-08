import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Pages/Details%20Screen/details_screen.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Order Tracking Screen/order_tracking_screen.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen(
      {super.key,
      required this.appbarTitle,
      required this.category,
      required this.subCategory});
  final String appbarTitle;
  final String category;
  final String subCategory;
  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
        title: ReusableText(
            weight: FontWeight.w700, fontSize: width * 0.045, lbl: appbarTitle),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: themeLightColor,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20,
            padding: EdgeInsets.only(bottom: height * 0.015),
            itemBuilder: (context, index) {
              return Material(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.015,
                      left: width * 0.025,
                      right: width * 0.025),
                  child: ListTile(
                    tileColor: themeColor,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: width * 0.035,
                            alignTxt: TextAlign.left,
                            lbl: category),
                        ReusableText(
                            weight: FontWeight.w500,
                            fontSize: width * 0.03,
                            alignTxt: TextAlign.left,
                            lbl: subCategory),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        appbarTitle == 'Active Orders'
                            ? Get.to(const OrderTrackingScreen(),
                                transition: Transition.fadeIn)
                            : Get.to(const DetailsScreen(),
                                transition: Transition.fadeIn);
                      },
                      child: Container(
                        height: height * 0.037,
                        width: width * 0.172,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(1, -1)),
                            ]),
                        child: Center(
                          child: ReusableText(
                              weight: FontWeight.w600,
                              fontSize: width * 0.0325,
                              lbl: 'Details'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
