import 'package:bmi_calculator/Constant/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final String text;
  final Function onTap;

  const BottomButton({Key key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: KLargeTextStyle,
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottomContainerHeight,
        color: KAccentColor,
      ),
    );
  }
}
