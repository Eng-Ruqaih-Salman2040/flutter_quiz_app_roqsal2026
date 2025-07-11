import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/screen/login_screen.dart';

import '../model/onboarding.dart';

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
            bottom: 50,
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

    return SingleChildScrollView(
      child: Container(
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
            const SizedBox(height: 30),
            Text(
              page.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28, // Reduced from 32 for better fit
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
                  fontSize: 16, // Reduced from 18 for better fit
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                page.details,
                style: TextStyle(
                  fontSize: 15, // Reduced from 16 for better fit
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20), // Reduced from 30 for better spacing
            Container(
              padding: const EdgeInsets.all(12), // Reduced from 16
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                page.icon,
                size: 30, // Reduced from 40 for better fit
                color: page.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}