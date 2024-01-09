import 'package:flutter/material.dart';

import '../../../../../Core/constants.dart';

class TopTickCircle extends StatelessWidget {
  const TopTickCircle({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width * 0.13,
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
