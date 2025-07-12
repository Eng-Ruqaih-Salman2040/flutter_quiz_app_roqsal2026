import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// ================== Material 3 Theme ==================
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00437a),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffb5d3ff),
      secondary: Color(0xff4b607d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc6dbfe),
      onSecondaryContainer: Color(0xff4b607e),
      tertiary: Color(0xff602977),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xfff0c0ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff414751),
      outline: Color(0xff727782),
      outlineVariant: Color(0xffc1c7d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff004882),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff031c36),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff334864),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff320047),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff652e7c),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffecedf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003766),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223752),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff596e8c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff531c6a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff0e1116),
      onSurfaceVariant: Color(0xff313640),
      outline: Color(0xff4d535d),
      outlineVariant: Color(0xff686d78),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xff296fb7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00569a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff596e8c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff415673),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8f56a6),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff753d8c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6cd),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffe7e8ee),
      surfaceContainerHigh: Color(0xffdbdce3),
      surfaceContainerHighest: Color(0xffd0d1d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002d55),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004a86),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff172d48),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354a66),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff480e5f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff68317f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272c35),
      outlineVariant: Color(0xff444953),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xff004a86),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003460),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354a66),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e344f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff68317f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4f1766),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b8bf),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff0f7),
      surfaceContainer: Color(0xffe1e2e9),
      surfaceContainerHigh: Color(0xffd3d4db),
      surfaceContainerHighest: Color(0xffc5c6cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa3c9ff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff00315c),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffb5d3ff),
      secondary: Color(0xffb2c8ea),
      onSecondary: Color(0xff1c314c),
      secondaryContainer: Color(0xff334864),
      onSecondaryContainer: Color(0xffa1b7d8),
      tertiary: Color(0xffebb2ff),
      onTertiary: Color(0xff4c1464),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xfff0c0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111418),
      onSurface: Color(0xffe1e2e9),
      onSurfaceVariant: Color(0xffc1c7d2),
      outline: Color(0xff8b919c),
      outlineVariant: Color(0xff414751),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff0f60a7),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff004882),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff031c36),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff334864),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff320047),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff652e7c),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9deff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff00264a),
      primaryContainer: Color(0xff5593de),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc9deff),
      onSecondary: Color(0xff0f2641),
      secondaryContainer: Color(0xff7d92b2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff5d0ff),
      onTertiary: Color(0xff400458),
      tertiaryContainer: Color(0xffb679cd),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd7dce8),
      outline: Color(0xffadb2be),
      outlineVariant: Color(0xff8b909c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff004984),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001227),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff003766),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff001227),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff223752),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff220031),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff531c6a),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff42444a),
      surfaceContainerLowest: Color(0xff05070c),
      surfaceContainerLow: Color(0xff1b1e22),
      surfaceContainer: Color(0xff25282d),
      surfaceContainerHigh: Color(0xff303338),
      surfaceContainerHighest: Color(0xff3b3e43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe9f0ff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9cc5ff),
      onPrimaryContainer: Color(0xff000c1d),
      secondary: Color(0xffe9f0ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec4e6),
      onSecondaryContainer: Color(0xff000c1d),
      tertiary: Color(0xfffeeaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeaacff),
      onTertiaryContainer: Color(0xff190025),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffebf0fc),
      outlineVariant: Color(0xffbdc3ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff004984),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff001227),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff001227),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff220031),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff4e5056),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2024),
      surfaceContainer: Color(0xff2e3036),
      surfaceContainerHigh: Color(0xff393b41),
      surfaceContainerHighest: Color(0xff44474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

// ================== App Theme Wrapper ==================
class AppTheme {
  static ThemeData lightTheme() {
    return MaterialTheme(TextTheme()).light();
  }

  static ThemeData darkTheme() {
    return MaterialTheme(TextTheme()).dark();
  }

  static ThemeData lightHighContrast() {
    return MaterialTheme(TextTheme()).lightHighContrast();
  }

  static ThemeData lightMediumContrast() {
    return MaterialTheme(TextTheme()).lightMediumContrast();
  }

  static ThemeData darkHighContrast() {
    return MaterialTheme(TextTheme()).darkHighContrast();
  }

  static ThemeData darkMediumContrast() {
    return MaterialTheme(TextTheme()).darkMediumContrast();
  }
}

// ================== Theme Notifier ==================
class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  bool _highContrast = false;
  bool _mediumContrast = false;

  ThemeNotifier(this._themeData);

  ThemeData getTheme() => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;
  bool get isHighContrast => _highContrast;
  bool get isMediumContrast => _mediumContrast;

  Future<void> setTheme(ThemeData themeData) async {
    _themeData = themeData;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (isDarkMode) {
      if (_highContrast) {
        _themeData = AppTheme.lightHighContrast();
      } else if (_mediumContrast) {
        _themeData = AppTheme.lightMediumContrast();
      } else {
        _themeData = AppTheme.lightTheme();
      }
    } else {
      if (_highContrast) {
        _themeData = AppTheme.darkHighContrast();
      } else if (_mediumContrast) {
        _themeData = AppTheme.darkMediumContrast();
      } else {
        _themeData = AppTheme.darkTheme();
      }
    }
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  Future<void> toggleContrast() async {
    final prefs = await SharedPreferences.getInstance();
    if (!_highContrast && !_mediumContrast) {
      _mediumContrast = true;
    } else if (_mediumContrast) {
      _mediumContrast = false;
      _highContrast = true;
    } else {
      _highContrast = false;
    }

    if (isDarkMode) {
      if (_highContrast) {
        _themeData = AppTheme.darkHighContrast();
      } else if (_mediumContrast) {
        _themeData = AppTheme.darkMediumContrast();
      } else {
        _themeData = AppTheme.darkTheme();
      }
    } else {
      if (_highContrast) {
        _themeData = AppTheme.lightHighContrast();
      } else if (_mediumContrast) {
        _themeData = AppTheme.lightMediumContrast();
      } else {
        _themeData = AppTheme.lightTheme();
      }
    }

    await prefs.setBool('highContrast', _highContrast);
    await prefs.setBool('mediumContrast', _mediumContrast);
    notifyListeners();
  }
}

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

// ================== Splash Screen ==================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
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
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.code,
                    color: colorScheme.onPrimary,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "CS Quiz Master",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
                  ),
                ),
                Text(
                  "Test Your Coding Knowledge",
                  style: TextStyle(
                    fontSize: 18,
                    color: colorScheme.onPrimary.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================== Onboarding Screen ==================
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Programming Language Quizzes",
      description: "Test your knowledge across multiple programming languages with our comprehensive quizzes",
      details: "• Python, Java, C++ and more\n• Beginner to advanced levels\n• Real-world coding scenarios\n• Detailed explanations",
      color: const Color(0xFF3498DB),
      icon: Icons.code,
      image: Icons.language,
    ),
    OnboardingPage(
      title: "Track Your Progress",
      description: "Monitor your learning journey with detailed statistics and achievements",
      details: "• Personalized progress tracking\n• Skill level assessments\n• Performance analytics\n• Achievements and badges",
      color: const Color(0xFF2ECC71),
      icon: Icons.analytics,
      image: Icons.trending_up,
    ),
    OnboardingPage(
      title: "Community Challenges",
      description: "Compete with other developers in timed challenges and leaderboards",
      details: "• Weekly coding challenges\n• Global leaderboards\n• Real-time competitions\n• Peer comparisons",
      color: const Color(0xFFE74C3C),
      icon: Icons.people,
      image: Icons.emoji_events,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() => _currentPage = page);
            },
            itemBuilder: (_, index) {
              return OnboardingPageView(
                page: _pages[index],
                colorScheme: colorScheme,
              );
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: _pages[_currentPage].color,
              ),
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const UserRegistrationScreen()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: _pages[_currentPage].color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? _pages[index].color
                            : colorScheme.onSurfaceVariant.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const UserRegistrationScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _pages[_currentPage].color,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageView extends StatelessWidget {
  final OnboardingPage page;
  final ColorScheme colorScheme;

  const OnboardingPageView({
    super.key,
    required this.page,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              page.image,
              size: 100,
              color: page.color,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: page.color,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              page.details,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              page.icon,
              size: 40,
              color: page.color,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String details;
  final Color color;
  final IconData icon;
  final IconData image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.details,
    required this.color,
    required this.icon,
    required this.image,
  });
}

// ================== User Registration Screen ==================
class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId: kIsWeb
        ? 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com'
        : null,
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _registerUser() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', true);
    await prefs.setString('userName', _nameController.text);
    if (_selectedImage != null) {
      await prefs.setString('imagePath', _selectedImage!.path);
    }

    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      setState(() => _isLoading = true);

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isRegistered', true);
      await prefs.setString('userName', googleUser.displayName ?? 'Google User');
      await prefs.setString('email', googleUser.email);

      if (googleUser.photoUrl != null) {
        await prefs.setString('imageUrl', googleUser.photoUrl!);
      }

      setState(() => _isLoading = false);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } catch (error) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: isSmallScreen ? 20 : 40),
              Text(
                "Create Your Profile",
                style: TextStyle(
                  fontSize: isSmallScreen ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 30),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: isSmallScreen ? 50 : 70,
                  backgroundColor: colorScheme.surfaceVariant,
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? Icon(
                    Icons.add_a_photo,
                    size: isSmallScreen ? 30 : 50,
                    color: colorScheme.onSurfaceVariant,
                  )
                      : null,
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person, color: colorScheme.primary),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant,
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
                style: TextStyle(color: colorScheme.onSurface),
              ),
              SizedBox(height: isSmallScreen ? 20 : 30),
              Text(
                "Or sign up with",
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: isSmallScreen ? 10 : 15),
              SizedBox(
                width: double.infinity,
                height: isSmallScreen ? 45 : 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.onSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    elevation: 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: isSmallScreen ? 20 : 24,
                        width: isSmallScreen ? 20 : 24,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(FontAwesomeIcons.google, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? 15 : 20),
              SizedBox(
                width: double.infinity,
                height: isSmallScreen ? 45 : 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(
                    color: colorScheme.onPrimary,
                  )
                      : Text(
                    'Start Quizzing',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ================== Dashboard Screen ==================
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userName = "User";
  String? imagePath;
  String searchQuery = "";
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
      imagePath = prefs.getString('imagePath');
    });
  }

  List<Category> getFilteredCategories() {
    if (searchQuery.isEmpty) {
      return categories;
    } else {
      return categories.where((category) =>
          category.name.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: // Home
          break;
        case 1: // Progress
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Showing your learning progress')),
          );
          break;
        case 2: // Bookmarks
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Showing your bookmarked questions')),
          );
          break;
        case 3: // Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SettingsScreen(
              userName: userName,
              imagePath: imagePath,
            )),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filteredCategories = getFilteredCategories();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final crossAxisCount = isSmallScreen ? 2 : 3;
    final childAspectRatio = isSmallScreen ? 1.0 : 0.9;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CS Quiz Master'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsScreen(
                  userName: userName,
                  imagePath: imagePath,
                )),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search programming languages...",
                hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                prefixIcon: Icon(Icons.search, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: colorScheme.surfaceVariant,
              ),
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isSmallScreen ? 10 : 16,
                  mainAxisSpacing: isSmallScreen ? 10 : 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  final category = filteredCategories[index];
                  return DashboardCard(
                    title: category.name,
                    icon: _getIconForCategory(category.name),
                    color: _getColorForCategory(index),
                    emoji: _getEmojiForCategory(category.name),
                    onTap: () {_showCategoryDetails(context, category);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.assessment_outlined),
            selectedIcon: Icon(Icons.assessment),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  IconData _getIconForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart':
        return FontAwesomeIcons.code;
      case 'flutter':
        return FontAwesomeIcons.mobileScreen;
      case 'c++':
        return FontAwesomeIcons.c;
      case 'python':
        return FontAwesomeIcons.python;
      case 'c#':
        return FontAwesomeIcons.microsoft;
      case 'java':
        return FontAwesomeIcons.java;
      case 'php':
        return FontAwesomeIcons.php;
      case 'asp':
        return FontAwesomeIcons.windows;
      case 'html':
        return FontAwesomeIcons.html5;
      case 'css':
        return FontAwesomeIcons.css3;
      case 'javascript':
        return FontAwesomeIcons.js;
      case 'sql':
        return FontAwesomeIcons.database;
      case 'ruby':
        return FontAwesomeIcons.gem;
      case 'swift':
        return FontAwesomeIcons.apple;
      case 'kotlin':
        return FontAwesomeIcons.android;
      case 'go':
        return FontAwesomeIcons.golang;
      case 'rust':
        return FontAwesomeIcons.rust;
      case 'typescript':
        return FontAwesomeIcons.jsSquare;
      case 'r':
        return FontAwesomeIcons.rProject;
      case 'perl':
        return FontAwesomeIcons.rProject;
      case 'haskell':
        return FontAwesomeIcons.rProject;
      case 'arduino':
        return FontAwesomeIcons.microchip;
      default:
        return Icons.code;
    }
  }

  Color _getColorForCategory(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.lime,
      Colors.brown,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.lightGreen,
    ];
    return colors[index % colors.length];
  }

  String _getEmojiForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart':
        return '🎯';
      case 'flutter':
        return '📱';
      case 'c++':
        return '➕';
      case 'python':
        return '🐍';
      case 'c#':
        return '♯';
      case 'java':
        return '☕';
      case 'php':
        return '🐘';
      case 'asp':
        return '🪟';
      case 'html':
        return '🌐';
      case 'css':
        return '🎨';
      case 'javascript':
        return '🟨';
      case 'sql':
        return '🗃️';
      case 'ruby':
        return '💎';
      case 'swift':
        return '🍏';
      case 'kotlin':
        return '🤖';
      case 'go':
        return '🚀';
      case 'rust':
        return '🦀';
      case 'typescript':
        return '🟦';
      case 'r':
        return '📊';
      case 'perl':
        return '🐪';
      case 'haskell':
        return 'λ';
      case 'arduino':
        return '🔌';
      default:
        return '💻';
    }
  }

  void _showCategoryDetails(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.name,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Starting ${category.name} quiz')),
                  );
                },
                child: Text('Start ${category.name} Quiz'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String emoji;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.emoji,
    required this.onTap, required bool isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: colorScheme.surfaceContainerHighest,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isSmallScreen ? 40 : 60,
                height: isSmallScreen ? 40 : 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: isSmallScreen ? 20 : 30,
                ),
              ),
              SizedBox(height: isSmallScreen ? 8 : 12),
              Text(
                title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isSmallScreen ? 4 : 8),
              Text(
                emoji,
                style: TextStyle(fontSize: isSmallScreen ? 20 : 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String? image;
  Category(this.id, this.name, {this.image});
}

final List<Category> categories = [
  Category(1, "Dart", image: 'assets/topic/image2.jpg'),
  Category(2, "Flutter", image: 'assets/topic/image13.jpg'),
  Category(3, "C++", image: 'assets/topic/image5.jpg'),
  Category(4, "Python", image: 'assets/topic/image16.jpg'),
  Category(5, "C#", image: 'assets/topic/image22.jpg'),
  Category(6, "Java", image: 'assets/topic/image14.jpg'),
  Category(7, "PHP", image: 'assets/topic/image9.jpg'),
  Category(8, "ASP", image: 'assets/topic/image18.jpg'),
  Category(9, "HTML", image: 'assets/topic/image10.jpg'),
  Category(10, "CSS", image: 'assets/topic/image20.jpg'),
  Category(11, "JavaScript", image: 'assets/topic/image2.jpg'),
  Category(12, "SQL", image: 'assets/topic/image12.jpg'),
  Category(13, "Ruby", image: 'assets/topic/image15.jpg'),
  Category(14, "Swift", image: 'assets/topic/image3.jpg'),
  Category(15, "Kotlin", image: 'assets/topic/image11.jpg'),
  Category(16, "Go", image: 'assets/topic/image7.jpg'),
  Category(17, "Rust", image: 'assets/topic/image21.jpg'),
  Category(18, "TypeScript", image: 'assets/topic/image17.jpg'),
  Category(19, "R", image: 'assets/topic/image19.jpg'),
  Category(20, "Perl", image: 'assets/topic/image2.jpg'),
  Category(21, "Haskell", image: 'assets/topic/image8.jpg'),
  Category(22, "Ardoino", image: 'assets/topic/image6.jpg'),
];

// ================== Settings Screen ==================
class SettingsScreen extends StatefulWidget {
  final String userName;
  final String? imagePath;

  const SettingsScreen({
    super.key,
    required this.userName,
    this.imagePath,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', _selectedImage!.path);
    }
  }

  Future<void> _updateUserName(String newName) async {
    if (newName.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', newName);
      setState(() {});
    }
  }

  Future<void> _exitApp() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit the application?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );

    if (shouldExit ?? false) {
      SystemNavigator.pop();
    }
  }

  Future<void> _clearDataAndLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('This will log you out and clear all data. Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear Data'),
          ),
        ],
      ),
    );

    if (shouldLogout ?? false) {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool('isDarkMode') ?? false;
      await prefs.clear();
      await prefs.setBool('isDarkMode', isDarkMode);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            (route) => false,
      );
    }
  }

  Future<void> _clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    SystemNavigator.pop();
  }

  Future<void> _rateApp() async {
    const url = 'https://play.google.com/store/apps/details?id=com.example.csquiz';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch app store')),
      );
    }
  }

  Future<void> _shareApp() async {
    const text = 'Check out this awesome CS Quiz app!';
    const subject = 'CS Quiz App Recommendation';
    const url = 'https://play.google.com/store/apps/details?id=com.example.csquiz';

    final shareUri = Uri(
      scheme: 'mailto',
      queryParameters: {
        'subject': subject,
        'body': '$text\n$url',
      },
    );

    if (await canLaunchUrl(shareUri)) {
      await launchUrl(shareUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch email client')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        children: [
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: isSmallScreen ? 40 : 50,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : widget.imagePath != null
                          ? FileImage(File(widget.imagePath!))
                          : null,
                      child: _selectedImage == null && widget.imagePath == null
                          ? Icon(Icons.person,
                          size: isSmallScreen ? 40 : 50,
                          color: colorScheme.onSurfaceVariant)
                          : null,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 16),
                  Text(
                    widget.userName,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final controller = TextEditingController(text: widget.userName);
                          return AlertDialog(
                            title: const Text('Edit Name'),
                            content: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                labelText: 'Your Name',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _updateUserName(controller.text);
                                  Navigator.pop(context);
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: isSmallScreen ? 12 : 16),

          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: theme.brightness == Brightness.dark,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contrast),
                  title: const Text('High Contrast'),
                  trailing: Switch(
                    value: themeNotifier.isHighContrast,
                    onChanged: (value) {
                      themeNotifier.toggleContrast();
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.contrast_outlined),
                  title: const Text('Medium Contrast'),
                  trailing: Switch(
                    value: themeNotifier.isMediumContrast,
                    onChanged: (value) {
                      themeNotifier.toggleContrast();
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Rate the App'),
                  onTap: _rateApp,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share the App'),
                  onTap: _shareApp,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Upgrade to Pro'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pro version coming soon!')),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: isSmallScreen ? 12 : 16),

          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  subtitle: const Text('Version 1.0.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Exit App'),
                  onTap: _exitApp,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: _clearDataAndLogout,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.clear_all),
                  title: const Text('Clear All Data'),
                  onTap: _clearUserData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}