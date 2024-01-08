import 'package:admin_beauty_app/Controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

List orderName = [
  'New',
  'Active',
  'Completed',
  'Cancelled',
];
List orderImage = [
  'assets/images/app icons-31.png',
  'assets/images/app icons-32.png',
  'assets/images/app icons-33.png',
  'assets/images/app icons-34.png',
];
List navBarTitle = [
  'Home',
  'Report',
  'Account',
];
List navBarIcons = [
  const Icon(
    FontAwesomeIcons.houseUser,
  ),
  Icon(
    Icons.insert_chart,
    size: Get.size.width * 0.07,
  ),
  const Icon(FontAwesomeIcons.addressBook),
];
List selectedNavBarIcons = [
  const Icon(
    FontAwesomeIcons.houseUser,
    color: Colors.green,
  ),
  Icon(
    Icons.insert_chart,
    color: Colors.green,
    size: Get.size.width * 0.07,
  ),
  const Icon(
    FontAwesomeIcons.addressBook,
    color: Colors.green,
  ),
];
final NavBarController navBarController = Get.put(NavBarController());
