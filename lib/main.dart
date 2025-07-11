import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:roqsal_quizapp_2026/provider/theme_provider.dart';
import 'package:roqsal_quizapp_2026/util/theme/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'provider/question_provider.dart';
import 'provider/score_provider.dart';
import 'screen/dashboard.dart';
import 'service/navigation_service.dart';
import 'util/router.dart';
import 'util/router_path.dart';
import 'package:provider/provider.dart';
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  final highContrast = prefs.getBool('highContrast') ?? false;
  final mediumContrast = prefs.getBool('mediumContrast') ?? false;

  ThemeData initialTheme;
  if (isDarkMode) {
    if (highContrast) {
      initialTheme = AppTheme.darkHighContrast();
    } else if (mediumContrast) {
      initialTheme = AppTheme.darkMediumContrast();
    } else {
      initialTheme = AppTheme.darkTheme();
    }
  } else {
    if (highContrast) {
      initialTheme = AppTheme.lightHighContrast();
    } else if (mediumContrast) {
      initialTheme = AppTheme.lightMediumContrast();
    } else {
      initialTheme = AppTheme.lightTheme();
    }
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier(initialTheme)),
        Provider<NavigationService>(create: (_) => NavigationService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorObservers: [routeObserver],
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routerr.generateRoute,
        initialRoute: SplashScreenDynamic,//SplashScreen,

        theme: themeNotifier.getTheme(),
        darkTheme: AppTheme.darkTheme(),

        // home: const SplashScreen(),
        // theme: ThemeData(
        //   primarySwatch: Colors.deepPurple,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
      );
    });
  }
}

/*

// ================== Main App ==================
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  final highContrast = prefs.getBool('highContrast') ?? false;
  final mediumContrast = prefs.getBool('mediumContrast') ?? false;

  ThemeData initialTheme;
  if (isDarkMode) {
    if (highContrast) {
      initialTheme = AppTheme.darkHighContrast();
    } else if (mediumContrast) {
      initialTheme = AppTheme.darkMediumContrast();
    } else {
      initialTheme = AppTheme.darkTheme();
    }
  } else {
    if (highContrast) {
      initialTheme = AppTheme.lightHighContrast();
    } else if (mediumContrast) {
      initialTheme = AppTheme.lightMediumContrast();
    } else {
      initialTheme = AppTheme.lightTheme();
    }
  }

  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(initialTheme),
      child: const CSQuizApp_Full_DeepSeek_lllllllll_4_1(),
    ),
  );
}

class CSQuizApp_Full_DeepSeek_lllllllll_4_1 extends StatelessWidget {
  const CSQuizApp_Full_DeepSeek_lllllllll_4_1({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'CS Quiz Master',
      theme: themeNotifier.getTheme(),
      darkTheme: AppTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
 */
