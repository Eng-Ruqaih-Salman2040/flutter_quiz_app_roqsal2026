import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/screen/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart'; // Where you defined routeObserver
import 'bookmarkspage.dart';
import 'homesscreen.dart';
import 'progresspage.dart';
import 'scorescreen.dart';
import 'settings_screen.dart';

// ================== Main Dashboard Screen ==================
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with RouteAware {
  String userName = "User";
  String? imagePath;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when coming back from pushed screen
  @override
  void didPopNext() {
    setState(() {
      _currentIndex = 0;
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
      imagePath = prefs.getString('imagePath');
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _currentIndex = 0;
      });
    } else {
      // Don't setState here: we'll reset on return via didPopNext
      _navigateToPage(index);
    }
  }

  void _navigateToPage(int index) {
    Widget page;
    switch (index) {
      case 1:
        page = const ScoreScreen();
        break;
      case 2:
        page = const ProgressPage();
        break;
      case 3:
        page = const BookMarksPage();
        break;
      case 4:
        page = ProfileScreen(//SettingsScreen(
          userName: userName,
          imagePath: imagePath,
        );
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CS Quiz Master'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(
                    userName: userName,
                    imagePath: imagePath,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const HomePage(),
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
            icon: Icon(Icons.history),
            selectedIcon: Icon(Icons.history_edu_outlined),
            label: 'Point',
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
}
