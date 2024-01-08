import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
            weight: FontWeight.w600,
            fontSize: width * 0.045,
            lbl: 'Details Screen'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: themeLightColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              TopTickCircle(
                width: width,
              ),
              Container(
                height: height * 0.5,
                width: width,
                margin: EdgeInsets.symmetric(vertical: height * 0.022),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: width * 0.04,
                        lbl: 'Order Details'),
                    ReusableText(
                        weight: FontWeight.w500,
                        fontSize: width * 0.025,
                        lbl: 'Chosen Glamour'),
                  ],
                ),
              ),
              Container(
                height: height * 0.1,
                width: width,
                margin: EdgeInsets.only(bottom: height * 0.025),
                decoration: BoxDecoration(
                    color: themeColor, borderRadius: BorderRadius.circular(7)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 2; i++)
                    Container(
                      height: height * 0.045,
                      width: width * 0.28,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: ReusableText(
                            weight: FontWeight.w600,
                            fontSize: width * 0.03,
                            lbl: 'Change Status'),
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

class TopTickCircle extends StatelessWidget {
  const TopTickCircle({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width * 0.11,
      backgroundColor: themeColor,
      child: Icon(
        Icons.done,
        color: Colors.black,
        weight: 20,
        size: width * 0.18,
      ),
    );
  }
}
