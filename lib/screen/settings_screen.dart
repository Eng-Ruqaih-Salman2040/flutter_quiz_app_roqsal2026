import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/provider/theme_provider.dart';
import 'package:roqsal_quizapp_2026/screen/introPage.dart';
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

  // Future<void> _clearDataAndLogout() async {
  //   final shouldLogout = await showDialog<bool>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Logout'),
  //       content: const Text('This will log you out and clear all data. Are you sure?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, false),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, true),
  //           child: const Text('Clear Data'),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   if (shouldLogout ?? false) {
  //     final prefs = await SharedPreferences.getInstance();
  //     final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  //     await prefs.clear();
  //     await prefs.setBool('isDarkMode', isDarkMode);
  //
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (_) => const IntroPage()),
  //           (route) => false,
  //     );
  //   }
  // }

  // In your SettingsScreen class
  //=============================== Use AlertDialog for Logout ============================
  // Future<void> _clearDataAndLogout() async {
  //   final shouldLogout = await showDialog<bool>(
  //     context: context,
  //     builder: (context) =>
  //
  //
  //
  //         AlertDialog(
  //       title: const Text('Logout'),
  //       content: const Text('This will log you out and reset all your progress, points, and bookmarks. Are you sure?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, false),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, true),
  //           child: const Text('Logout', style: TextStyle(color: Colors.red)),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   if (shouldLogout ?? false) {
  //     try {
  //       // Reset all providers
  //       await Provider.of<BookmarkProvider>(context, listen: false).clearAllBookmarks();
  //       Provider.of<QuestionProvider>(context, listen: false).resetAllProgress();
  //       Provider.of<ScoreProvider>(context, listen: false).resetAllScores();
  //
  //       // Clear shared preferences except theme settings
  //       final prefs = await SharedPreferences.getInstance();
  //       final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  //       final isHighContrast = prefs.getBool('isHighContrast') ?? false;
  //       final isMediumContrast = prefs.getBool('isMediumContrast') ?? false;
  //
  //       await prefs.clear();
  //
  //       // Restore theme settings
  //       await prefs.setBool('isDarkMode', isDarkMode);
  //       await prefs.setBool('isHighContrast', isHighContrast);
  //       await prefs.setBool('isMediumContrast', isMediumContrast);
  //
  //       // Navigate to intro page
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (_) => const IntroPage()),
  //             (route) => false,
  //       );
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Logged out successfully')),
  //       );
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Error during logout')),
  //       );
  //     }
  //   }
  // }
//============================ Use AwesomeDialog for Logout Delete only BookMarks============================
//   Future<void> _clearDataAndLogout() async {
//     final shouldLogout = await AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.bottomSlide,
//       title: 'Logout Confirmation',
//       desc: 'This will log you out and reset all your progress, points, and bookmarks. Are you sure?',
//       btnCancelText: 'Cancel',
//       btnCancelColor: Colors.grey,
//       btnCancelOnPress: () {},
//       btnOkText: 'Logout',
//       btnOkColor: Colors.red,
//       btnOkOnPress: () async {
//         try {
//           // Reset all providers
//           await Provider.of<BookmarkProvider>(context, listen: false)
//               .clearAllBookmarks();
//           Provider.of<QuestionProvider>(context, listen: false)
//               .resetAllProgress();
//           Provider.of<ScoreProvider>(context, listen: false).resetAllScores();
//
//           // Clear shared preferences except theme settings
//           final prefs = await SharedPreferences.getInstance();
//           final isDarkMode = prefs.getBool('isDarkMode') ?? false;
//           final isHighContrast = prefs.getBool('isHighContrast') ?? false;
//           final isMediumContrast = prefs.getBool('isMediumContrast') ?? false;
//
//           await prefs.clear();
//
//           // Restore theme settings
//           await prefs.setBool('isDarkMode', isDarkMode);
//           await prefs.setBool('isHighContrast', isHighContrast);
//           await prefs.setBool('isMediumContrast', isMediumContrast);
//
//           // Navigate to intro page
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (_) => const IntroPage()),
//                 (route) => false,
//           );
//
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Logged out successfully')),
//           );
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Error during logout')),
//           );
//         }
//       },
//     ).show().then((value) => value ?? false);
//   }

  ////============================ Clear All Data ============================
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
            const SnackBar(content: Text('Logged out successfully - All data cleared')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error during logout: ${e.toString()}')),
          );
        }
      },
    ).show();
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
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: _clearDataAndLogout,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.clear_all),
                  title: const Text('Clear ‘User Data'),
                  onTap: _clearUserData,
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