import 'package:flutter/material.dart';
final List hintTxt = [
  'Email Address',
  'Password',
];
final List iconsList = [
  Icons.email,
  Icons.lock,
];
final List errorMsj = [
  'please! Enter Your Email',
  'please! Enter Password',
];
final loginEmailTextController = TextEditingController();
final loginPasswordTextController = TextEditingController();
final List txtControllers=[
  loginEmailTextController,
  loginPasswordTextController,
];
// final AuthController authController = Get.put(AuthController());
// final LoadingStopController loadingStopController =
// Get.put(LoadingStopController());