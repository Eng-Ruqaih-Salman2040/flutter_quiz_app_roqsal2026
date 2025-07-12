// ======================== SETTINGS SCREEN ========================
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/provider/theme_provider.dart';
import 'package:roqsal_quizapp_2026/screen/introPage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/bookmark_provider.dart';
import '../provider/question_provider.dart';
import '../provider/score_provider.dart';
import '../util/dbmanager.dart';

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
    final shouldLogout = await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Logout Confirmation',
      desc: 'This will log you out and clear all your bookmarks, progress, and points. Only theme settings will be saved.',
      btnCancelText: 'Cancel',
      btnCancelColor: Colors.grey,
      btnCancelOnPress: () {},
      btnOkText: 'Logout',
      btnOkColor: Colors.red,
      btnOkOnPress: () async {
        try {
          // Clear all database data
          final dbManager = DbManager();
          await dbManager.clearAllBookmarks();
          await dbManager.clearAllScores();

          // Clear all providers data
          Provider.of<QuestionProvider>(context, listen: false).resetAllProgress();

          // Get current theme settings before clearing
          final prefs = await SharedPreferences.getInstance();
          final isDarkMode = prefs.getBool('isDarkMode') ?? false;
          final isHighContrast = prefs.getBool('isHighContrast') ?? false;
          final isMediumContrast = prefs.getBool('isMediumContrast') ?? false;

          // Clear all shared preferences
          await prefs.clear();

          // Restore only theme settings
          await prefs.setBool('isDarkMode', isDarkMode);
          await prefs.setBool('isHighContrast', isHighContrast);
          await prefs.setBool('isMediumContrast', isMediumContrast);

          // Navigate to intro page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const IntroPage()),
                (route) => false,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged out successfully')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error during logout: ${e.toString()}')),
          );
        }
      },
    ).show();
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

    Share.share(
      '$text\n$url',
      subject: subject,
    );
  }

  Future<void> _contactUs() async {
    const email = 'support@roqsalquiz.com';
    const subject = 'Roqsal Quiz App Support';
    const body = 'Hello Eng Ruqaih,\n\nI would like to contact you regarding...';

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
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
    final isDarkMode = theme.brightness == Brightness.dark;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        children: [
          // Theme Settings
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
                // Sun/Moon theme switcher with mode text
                ListTile(
                  leading: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode
                        ? colorScheme.primary
                        : colorScheme.primary,
                  ),
                  title: const Text('Theme Mode'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Display current mode text
                      Text(
                        isDarkMode ? 'Dark' : 'Light',
                        style: TextStyle(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Theme switch
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) => themeNotifier.toggleTheme(),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.contrast),
                  title: const Text('High Contrast'),
                  trailing: Switch(
                    value: themeNotifier.isHighContrast,
                    onChanged: (value) => themeNotifier.toggleContrast(),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.contrast_outlined),
                  title: const Text('Medium Contrast'),
                  trailing: Switch(
                    value: themeNotifier.isMediumContrast,
                    onChanged: (value) => themeNotifier.toggleContrast(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isSmallScreen ? 12 : 16),

          // App Actions
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
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
                  leading: const Icon(Icons.contact_support),
                  title: const Text('Contact Support'),
                  onTap: _contactUs,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.upgrade),
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

          // App Info
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  subtitle: Text(
                    'Version 1.0.0',
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Privacy Policy'),
                  onTap: () => launchUrl(Uri.parse('https://roqsalquiz.com/privacy')),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Terms of Service'),
                  onTap: () => launchUrl(Uri.parse('https://roqsalquiz.com/terms')),
                ),
              ],
            ),
          ),

          SizedBox(height: isSmallScreen ? 12 : 16),

          // Account Management
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.clear_all),
                  title: const Text('Clear All Data'),
                  onTap: _clearDataAndLogout,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Exit App'),
                  onTap: _exitApp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}