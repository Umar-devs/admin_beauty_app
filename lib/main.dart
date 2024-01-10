import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Pages/Home Screen/home_screen.dart';
import 'View/Pages/My Bottom Nav Bar/my_bottom_nav.dart';
import 'View/Pages/Orders Report Screen/orders_report_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
    );
  }
}
