//part of widgets;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants/styles.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Text(
        "Are you ready to learn programming easily in the funniest way?",
        style: AppStyles.homeTitleTextStyle,
      ),
    );
  }
}
