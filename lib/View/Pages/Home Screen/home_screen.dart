import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Orders List screen/orders_list_screen.dart';
import 'home_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return Container(
      height: height,
      width: width,
      color: const Color(0xffebc1a9).withOpacity(0.1),
      padding: EdgeInsets.only(top: height * 0.01),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            child: Image.asset(
              'assets/images/logo.png',
              height: height * 0.17,
              width: width * 0.6,
            ),
          ),
          SizedBox(
            height: height * 0.39,
            width: width * 0.85,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                        OrdersListScreen(
                          appbarTitle: '${orderName[index]} Orders',
                          category: 'Hair Styling',
                          subCategory: 'Blow Dry(\$34)',
                        ),
                        transition: Transition.fadeIn),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.all(1),
                      padding: EdgeInsets.symmetric(vertical: height * 0.03),
                      decoration: BoxDecoration(
                          color: Colors.white, boxShadow: shadows[index]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            orderImage[index],
                            height: height * 0.075,
                            width: width * 0.125,
                          ),
                          ReusableText(
                              weight: FontWeight.w600,
                              fontSize: width * 0.04,
                              lbl: orderName[index])
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
