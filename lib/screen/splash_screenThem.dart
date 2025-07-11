/*
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:roqsal_quizapp_2026/util/constants/assets.dart';
import 'package:roqsal_quizapp_2026/util/router_path.dart';
import '../util/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {  // Changed to TickerProviderStateMixin
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textSlide;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();
    _initAnimations();
   // _startNavigationTimer();
    checkRegistrationStatus();
  }
  Future<void> checkRegistrationStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final isRegistered = prefs.getBool('isRegistered') ?? false;

    if (isRegistered) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      Timer(const Duration(seconds: 10), () {
        if (mounted) {  // Check if widget is still mounted
          Navigator.of(context).pushReplacementNamed(IntroScreen);
        }
      });
      // Navigator.of(context).pushReplacementNamed(IntroScreen);

      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (_, __, ___) => const OnboardingScreen(),
      //     transitionsBuilder: (_, a, __, c) =>
      //         FadeTransition(opacity: a, child: c),
      //   ),
      // );
    }
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Rotation animation
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Logo animations
    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Text animations
    _textSlide = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  void _startNavigationTimer() {
    Timer(const Duration(seconds: 10), () {
      if (mounted) {  // Check if widget is still mounted
        Navigator.of(context).pushReplacementNamed(IntroScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      //backgroundColor: colorScheme.surface,//colorScheme.primary,
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rotating logo with scale and opacity
                Transform.scale(
                  scale: _logoScale.value,
                  child: Opacity(
                    opacity: _logoOpacity.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        alignment: Alignment.center,
                        child: Container(
                            height: 60.h,
                            width: 100.w,
                            alignment: Alignment.center,
                            color: AppPalette.transparentColor,
                         child: SvgPicture.asset(AppImages.splashImage)),
                        // SvgPicture.asset(
                        //   AppImages.splashImage,
                        //  // color: Colors.blue[800], // Force color if needed
                        // ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 4.h),
                // Container(
                //   width: 150,
                //   height: 150,
                //   decoration: BoxDecoration(
                //     color: colorScheme.surface,
                //     shape: BoxShape.circle,
                //     boxShadow: [
                //       BoxShadow(
                //         color: colorScheme.shadow.withOpacity(0.2),
                //         blurRadius: 20,
                //         spreadRadius: 5,
                //       ),
                //     ],
                //   ),
                //   child: Icon(
                //     Icons.code,
                //     color: colorScheme.onPrimary,
                //     size: 80,
                //   ),
                // ),
                // SizedBox(height: 4.h),

                // Text with slide and fade animation
                Transform.translate(
                  offset: Offset(0, _textSlide.value),
                  child: Opacity(
                    opacity: _textOpacity.value,
                    child: Column(
                      children: [
                        Text(
                          "Quiz Master",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "Learn • Challenge • Grow",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}*/


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

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textSlide;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    checkRegistrationStatus();
  }

  Future<void> checkRegistrationStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final isRegistered = prefs.getBool('isRegistered') ?? false;

    if (isRegistered) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      Timer(const Duration(seconds: 10), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(IntroScreen);
        }
      });
    }
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _textSlide = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _logoScale.value,
                  child: Opacity(
                    opacity: _logoOpacity.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        alignment: Alignment.center,
                        //-------------------------------------------------------
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          alignment: Alignment.center,
                          //color: Colors.transparent,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,),
                          child:
                          ThemeSvgAsset(
                            assetPath: AppImages.splashImageTheme,
                            width: 300,
                            height: 300,
                            isDarkMode: //_isDarkMode,
                                themeNotifier.isDarkMode, // Use the theme notifier
                          ),

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Transform.translate(
                  offset: Offset(0, _textSlide.value),
                  child: Opacity(
                    opacity: _textOpacity.value,
                    child: Column(
                      children: [
                        Text(
                          "Quiz Master",
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "Learn • Challenge • Grow",
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

