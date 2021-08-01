import 'package:flutter/material.dart';
import 'package:flutter_apk_bmi_calculator/components/Constant.dart';
import 'package:flutter_apk_bmi_calculator/components/ReusableCard.dart';
import 'package:flutter_apk_bmi_calculator/components/bottomButton.dart';

class ResultPage extends StatelessWidget {
  final getBMIResult;
  final getBMICalculator;
  final getBMInterpreation;

  const ResultPage({
    @required this.getBMIResult,
    @required this.getBMICalculator,
    @required this.getBMInterpreation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleStringStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getBMIResult.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      getBMICalculator,
                      style: kBMIStringStyle,
                    ),
                    Text(
                      getBMInterpreation,
                      textAlign: TextAlign.center,
                      style: kTextTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTaped: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
