import 'package:flutter/material.dart';

import 'Constant.dart';

class IconContent extends StatelessWidget {
  IconContent({this.genderIcon, this.genderString});

  final IconData genderIcon;
  final String genderString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderString,
          style: kLabelStringStyle,
        ),
      ],
    );
  }
}
