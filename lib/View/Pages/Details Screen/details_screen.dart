import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Pages/My%20Bottom%20Nav%20Bar/my_bottom_nav.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/custom_btn.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/Reusable Components/top_tick_circle.dart';
import 'data.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key,
      required this.isNewOrder,
      required this.name,
      required this.category,
      required this.service,
      required this.time,
      required this.date,
      required this.phone,
      required this.price,
      required this.address,
      required this.status,
      required this.ind});
  final bool isNewOrder;
  final String name;
  final String category;
  final String service;
  final String time;
  final String date;
  final String phone;
  final String price;
  final String address;
  final String status;
  final String ind;
  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    List<String> details = [
      status,
      '',
      name,
      '',
      category,
      '',
      service,
      '',
      time,
      '',
      date,
      '',
      phone,
    ];
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
        title: ReusableText(
            weight: FontWeight.w600,
            fontSize: width * 0.045,
            lbl: 'Details Screen'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: themeLightColor,
        padding: EdgeInsets.only(
            left: width * 0.08, right: width * 0.08, top: height * 0.0225),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TopTickCircle(
                width: width,
              ),
              Container(
                height: height * 0.49,
                width: width,
                margin: EdgeInsets.symmetric(vertical: height * 0.0225),
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.04,
                        lbl: 'Order Details'),
                    ReusableText(
                        weight: FontWeight.w500,
                        fontSize: width * 0.025,
                        lbl: 'Chosen Glamour'),
                    Divider(
                      color: Colors.black87,
                      indent: width * 0.05,
                      endIndent: width * 0.05,
                    ),
                    for (int i = 0; i < 13; i++)
                      i % 2 == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                    weight: FontWeight.w600,
                                    fontSize: width * 0.035,
                                    lbl: heading[i]),
                                ReusableText(
                                    weight: FontWeight.w500,
                                    fontSize: width * 0.03,
                                    lbl: details[i])
                              ],
                            )
                          : const Divider(
                              color: Colors.black12,
                            ),
                    Divider(
                      color: Colors.black87,
                      indent: width * 0.05,
                      endIndent: width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            weight: FontWeight.w500,
                            fontSize: width * 0.03,
                            lbl: 'Sub Total'),
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: width * 0.035,
                            lbl: '£$price'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.1,
                width: width,
                margin: EdgeInsets.only(bottom: height * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                decoration: BoxDecoration(
                    color: themeColor, borderRadius: BorderRadius.circular(7)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.035,
                        lbl: 'Treatment Address'),
                    const SizedBox(
                      height: 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ReusableText(
                          weight: FontWeight.w500,
                          fontSize: width * 0.03,
                          alignTxt: TextAlign.left,
                          lbl: address),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 2; i++)
                    GestureDetector(
                      onTap: () => i == 0
                          ? Get.bottomSheet(Container(
                              height: isNewOrder == true
                                  ? height * 0.2
                                  : height * 0.15,
                              width: width,
                              decoration: BoxDecoration(
                                  color: themeLightColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.045,
                                      width: width * 0.13,
                                      color: themeColor,
                                      margin: EdgeInsets.only(
                                          bottom: height * 0.025),
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () => Get.back(),
                                            icon: const Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ),
                                    CustomBtn(
                                      onTap: () {
                                        FirebaseDatabase.instance
                                            .ref()
                                            .child('Orders List')
                                            .child(ind)
                                            .set({
                                          'name': name,
                                          'category': category,
                                          'service': service,
                                          'time': time,
                                          'date': date,
                                          'phone': phone,
                                          'status': isNewOrder == true
                                              ? 'active'
                                              : 'remove',
                                          'price': price,
                                          'address': address,
                                        }).then((value) => Get.offAll(
                                                const MyBottomNavBar(),
                                                transition: Transition.fadeIn));
                                      },
                                      height: height,
                                      width: width,
                                      title: isNewOrder == true
                                          ? 'Active Order'
                                          : 'Remove Order',
                                      btnHeight: height * 0.045,
                                      btnWidth: width * 0.3,
                                      bottomPad: height * 0.015,
                                      fontSizeTitle: width * 0.0315,
                                    ),
                                    isNewOrder == true
                                        ? CustomBtn(
                                            onTap: () {
                                              FirebaseDatabase.instance
                                                  .ref()
                                                  .child('Orders List')
                                                  .child(ind)
                                                  .set({
                                                'name': name,
                                                'category': category,
                                                'service': service,
                                                'time': time,
                                                'date': date,
                                                'phone': phone,
                                                'status': 'cancel',
                                                'price': price,
                                                'address': address,
                                              }).then((value) => Get.offAll(
                                                      const MyBottomNavBar(),
                                                      transition:
                                                          Transition.fadeIn));
                                            },
                                            height: height,
                                            width: width,
                                            title: 'Cancel Order',
                                            btnHeight: height * 0.045,
                                            btnWidth: width * 0.3,
                                            fontSizeTitle: width * 0.0315,
                                          )
                                        : const Text(''),
                                  ],
                                ),
                              ),
                            ))
                          : Get.offAll(const MyBottomNavBar(),
                              transition: Transition.fadeIn),
                      child: Container(
                        height: height * 0.045,
                        width: width * 0.33,
                        decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: ReusableText(
                              weight: FontWeight.w600,
                              fontSize: width * 0.03,
                              lbl: btnTitle[i]),
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
