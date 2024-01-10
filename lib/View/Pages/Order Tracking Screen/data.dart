import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Core/constants.dart';

List<String> statusRowStatus = [
  'Booking Confirmed',
  '',
  'Beautician on route',
  '',
  'Beautician outside',
  '',
  'Treatment Completed',
];
List<String> statusRowDateTime = [
  '\n1/8/24 At 11.00 Am',
  '',
  '\n10/8/24 At 9.00 Am',
  '',
  '\nUpcoming',
  '',
  '\nUpcoming',
];
List statusRowIcon = [
  Icons.done,
  '',
  FontAwesomeIcons.car,
  '',
  Icons.home,
  '',
  Icons.check_circle,
];
List statusRowColor = [
  themeColor,
  '',
  themeColor,
  '',
  Colors.transparent,
  '',
  Colors.transparent,
];
