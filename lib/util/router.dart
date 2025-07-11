import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard_screen.dart';
import 'package:roqsal_quizapp_2026/screen/login_screen.dart';
import 'package:roqsal_quizapp_2026/screen/onboarding_screen.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_screen.dart';
//import 'package:roqsal_quizapp_2026/screen/splash_screen.dart';
import 'package:roqsal_quizapp_2026/screen/splash_screenThem.dart';
import 'package:roqsal_quizapp_2026/util/router_path.dart';

import '../model/question.dart';
import '../screen/introPage.dart';
import '../screen/scorescreen.dart';


class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenDynamic:
        return MaterialPageRoute(builder: (_) =>  SplashPage());
      case IntroScreen:
        return MaterialPageRoute(builder: (_) =>  IntroPage());
      case Onboardingscreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Login:
        return MaterialPageRoute(builder: (_) => const UserRegistrationScreen());

      case DashBoardScreen2:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case DashBoardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case QuizScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuizPage(
            listQuestion: args['listQuestion'] as List<Question>,
            id: args['id'] as int,
            difficult: args['difficult'] as String,
          ),
        );
      case QuizFinishScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuizFinishPage(
            title: args['title'] as String,
            answer: args['answer'] as Map<int, dynamic>,
            listQuestion: args['listQuestion'] as List<Question>,
          ),
        );
      case ScorePage:
        return MaterialPageRoute(builder: (_) => const ScoreScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}