import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_apk_bmi_calculator/brainCalculator.dart';
import 'package:flutter_apk_bmi_calculator/components/Constant.dart';
import 'package:flutter_apk_bmi_calculator/components/ReusableCard.dart';
import 'package:flutter_apk_bmi_calculator/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/IconContent.dart';
import '../components/RoundIconButton.dart';
import '../components/bottomButton.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
  Gender gender;
  int height = 160;
  int weight = 60;
  int age = 10;

  void updateCardColor(Gender gender) {
    gender == Gender.male
        ? maleCardColor = kActiveCardColor
        : maleCardColor = kInActiveCardColor;
    gender == Gender.female
        ? femaleCardColor = kActiveCardColor
        : femaleCardColor = kInActiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    containerChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      genderString: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    containerChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      genderString: 'FEMALE',
                    ),
                    colour: gender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStringStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumericStringStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20)),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      activeColor: kBottomContainerColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    containerChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStringStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumericStringStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    containerChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStringStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumericStringStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
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
            buttonText: 'CALCULATE',
            onTaped: () {
              BrainCalculator calc =
                  BrainCalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          getBMICalculator: calc.bmiCalculator(),
                          getBMInterpreation: calc.getBMIInterpretation(),
                          getBMIResult: calc.getBMIResult(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
