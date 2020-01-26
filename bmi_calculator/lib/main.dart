import 'package:bmi_calculator/Constant/constants.dart';
import 'package:flutter/material.dart';

import 'Screens/input_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF090B22),
          scaffoldBackgroundColor: Color(0xFF0F1327),
          accentColor: KAccentColor),
      home: BMICalculator(),
    );
  }
}
