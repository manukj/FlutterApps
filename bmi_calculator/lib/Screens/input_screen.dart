import 'package:bmi_calculator/Screens/result_screen.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/customWidgets/bottom_button.dart';
import 'package:bmi_calculator/customWidgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Constant/constants.dart';
import '../customWidgets/round_icon.dart';
import '../customWidgets/icon_content.dart';

class BMICalculator extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  Male,
  Female,
}

class _InputPageState extends State<BMICalculator> {
  Color maleCardColor = KInActiveCardColor;
  Color femaleCardColor = KInActiveCardColor;

  Gender selectedGender;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Application"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //gender section
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                    color: selectedGender == Gender.Male
                        ? KActiveCardColor
                        : KInActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: "Female",
                    ),
                    color: selectedGender == Gender.Female
                        ? KActiveCardColor
                        : KInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),

          // slidder
          Expanded(
            child: ReusableCard(
                color: KInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //which is vertical
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: KLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //which is horizontal
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: KNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: KLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: KAccentColor,
                        overlayColor: KLightAccentColor,
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        min: 120.0,
                        max: 220.0,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: KLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: KInActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: KInActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: KLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
            onTap: () {
              CalculatorBrain calculate = new CalculatorBrain(height, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calculate.getBMI(),
                            resultText: calculate.getResult(),
                            interpretation: calculate.getInterpretation(),
                          )));
            },
            text: "CALCULATE BMI",
          )
        ],
      ),
    );
  }
}
