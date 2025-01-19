import 'package:bmi_calculator/bmi_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          home: BmiPage(),
          debugShowCheckedModeBanner: false,
        );
      },
      maximumSize: Size(475.0, 812.0)));
}
