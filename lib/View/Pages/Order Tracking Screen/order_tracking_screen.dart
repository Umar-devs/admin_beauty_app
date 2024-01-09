import 'package:admin_beauty_app/View/Pages/Order%20Tracking%20Screen/Components/Reusable%20Components/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Core/constants.dart';
import '../../Reusable Components/reusable_text.dart';
import 'Components/Reusable Components/order_status_row.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
        title: ReusableText(
            weight: FontWeight.w600,
            fontSize: width * 0.045,
            lbl: 'Order Status'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        height: height,
        width: width,
        color: themeLightColor,
        padding: EdgeInsets.only(
            left: width * 0.08, right: width * 0.08, top: height * 0.025),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                'assets/images/login icon.png',
                height: height * 0.12,
                width: width * 0.25,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              OrderStatusRow(
                width: width,
                status: 'Booking Confirmed',
                time: '\n1/8/24 At 11.00 Am',
                icon: Icons.done,
                backgroundColor: themeColor,
                height: height,
              ),
              dottedLine(width, height),
              OrderStatusRow(
                  width: width,
                  status: 'Beautician on route',
                  time: '\n10/8/24 At 9.00 Am',
                  icon: FontAwesomeIcons.car,
                  backgroundColor: themeColor,
                  track: true,
                  height: height),
              dottedLine(width, height),
              OrderStatusRow(
                  width: width,
                  status: 'Beautician outside',
                  time: '\nUpcoming',
                  icon: Icons.home,
                  backgroundColor: Colors.transparent,
                  height: height),
              dottedLine(width, height),
              OrderStatusRow(
                  width: width,
                  status: 'Treatment Completed',
                  time: '\nUpcoming',
                  icon: Icons.check_circle,
                  backgroundColor: Colors.transparent,
                  height: height),
            ],
          ),
        ),
      )),
    );
  }
}
