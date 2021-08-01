import 'package:flutter/material.dart';

import 'Constant.dart';

class BottomButton extends StatelessWidget {
  final Function onTaped;
  final String buttonText;
  const BottomButton({
    this.onTaped,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kBottomButtonStringStyle,
          ),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
      ),
    );
  }
}
