import 'package:flutter/material.dart';

import 'dotted_line_painter.dart';

Widget dottedLine(width,height){
  return   Padding(
    padding: EdgeInsets.only(
        left: width * 0.05,
        top: height * 0.005,
        bottom: height * 0.005),
    child: Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: height * 0.1,
        width: 2,
        child: CustomPaint(
          painter: DottedLinePainter(),
        ),
      ),
    ),
  );
}