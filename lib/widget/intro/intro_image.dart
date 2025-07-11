//part of widgets;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../util/constant.dart';
import 'package:flutter_svg/svg.dart';
//
// import '../../../config/constants/assets.dart';
// import '../../../config/constants/palette.dart';
import '../../util/constants/assets.dart';

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: 100.w,
        alignment: Alignment.center,
        color: AppPalette.transparentColor,
        child: SvgPicture.asset(AppImages.homeImage));
  }
}
