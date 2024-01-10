import 'package:admin_beauty_app/View/Pages/My%20Bottom%20Nav%20Bar/data.dart';
import 'package:flutter/material.dart';
import '../../../Core/constants.dart';
import '../../Reusable Components/reusable_text.dart';
import '../Home Screen/home_data.dart';
import 'package:get/get.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return SafeArea(
        child: Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: themeColor,
            leading: const Text(''),
            centerTitle: true,
            title: ReusableText(
                weight: FontWeight.w600,
                fontSize: width * 0.055,
                lbl: 'Admin Panel'),
          ),
          bottomNavigationBar: Container(
            height: height * 0.075,
            width: width,
            color: themeColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 3; i++)
                  GestureDetector(
                    onTap: () {
                      navBarController.changeIndex(i);
                    },
                    child: Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        navBarController.indexNum.value == i
                            ? selectedNavBarIcons[i]
                            : navBarIcons[i],
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: navBarController.indexNum.value == i
                                ? width * 0.038
                                : width * 0.036,
                            clr: navBarController.indexNum.value == i
                                ? Colors.green
                                : Colors.black,
                            lbl: navBarTitle[i]),
                      ],
                    )),
                  )
              ],
            ),
          ),
          body: navScreens.elementAt(navBarController.indexNum.value),
        )));
  }
}
