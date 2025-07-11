/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
// import 'package:roqsal_flutterguid_quiz_2026/config/constants/palette.dart';
// import 'package:roqsal_flutterguid_quiz_2026/presentation/widgets/index.dart';

import '../util/constant.dart';
import '../util/constants/assets.dart';
import '../util/constants/styles.dart';
import '../util/router_path.dart';
import '../widget/intro/intro_button.dart';
import '../widget/intro/intro_image.dart';
import '../widget/intro/intro_title.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Image takes 50% of available height
            SizedBox(
              height: 50.h,
              child: const IntroImage(),
            ),
            // Title takes flexible space
            Expanded(
              flex: 2,
              child: const IntroTitle(),
            ),
            // Button takes fixed space at bottom
            const IntroButton(),
          ],
        ),
      ),
    );
  }
}
class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      alignment: Alignment.center,
      color: AppPalette.transparentColor,
      child: SvgPicture.asset(AppImages.homeImage),
    );
  }
}
class IntroTitle extends StatelessWidget {
  const IntroTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w), // Use w instead of h for horizontal padding
      child: Text(
        "Are you ready to learn programming easily in the funniest way?",
        style: AppStyles.homeTitleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
class IntroButton extends StatefulWidget {
  const IntroButton({Key? key}) : super(key: key);

  @override
  _IntroButtonState createState() => _IntroButtonState();
}

class _IntroButtonState extends State<IntroButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Container(
        width: 70.w,
        height: 7.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppPalette.homeButtonColor,
        ),
        child: Material(
          color: AppPalette.transparentColor,
          child: InkWell(
            onTap: () {
             // Navigator.of(context).pushReplacementNamed(DashBoardScreen);
              Navigator.of(context).pushReplacementNamed(Onboardingscreen);
            },
            child: Center(
              child: Text(
                "Start now",
                style: AppStyles.homeButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



*/



import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard_screen.dart';
import 'package:roqsal_quizapp_2026/util/theme/svgTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:roqsal_quizapp_2026/util/constants/assets.dart';
import 'package:roqsal_quizapp_2026/util/router_path.dart';
import '../provider/theme_provider.dart';
import '../util/constant.dart';



class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.h,
              child: const IntroImage(),
            ),
            Expanded(
              flex: 2,
              child: const IntroTitle(),
            ),
            const IntroButton(),
          ],
        ),
      ),
    );
  }
}

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      width: 100.w,
      alignment: Alignment.center,
      color: Colors.transparent,
        child:
   /*     ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.blue.withOpacity(0.5), // 50% transparent blue
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            AppImages.homeImage,
            width: 200,
            height: 200,
            placeholderBuilder: (context) => Icon(Icons.image, size: 50),
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.transparent, Colors.blue],
            ).createShader(bounds);
          },
          child: SvgPicture.asset(
            AppImages.homeImage,
            width: 200,
            height: 200,
          ),
        )*/
        ThemeSvgAsset(
          assetPath: AppImages.homeImageDynamic,
          width: 300,
          height: 300,
          isDarkMode: //_isDarkMode,
          themeNotifier.isDarkMode, // Use the theme notifier
        ),

    );
  }
}

class IntroTitle extends StatelessWidget {
  const IntroTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(
        "Are you ready to learn programming easily in the funniest way?",
        style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class IntroButton extends StatefulWidget {
  const IntroButton({Key? key}) : super(key: key);

  @override
  _IntroButtonState createState() => _IntroButtonState();
}

class _IntroButtonState extends State<IntroButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: FilledButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Onboardingscreen);
        },
        style: FilledButton.styleFrom(
          minimumSize: Size(70.w, 7.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          "Start now",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
