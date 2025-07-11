import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/screen/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String? imagePath;

  const ProfileScreen({
    super.key,
    required this.userName,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
            child: imagePath == null ? Icon(Icons.person, size: 50) : null,
          ),
          Text(userName),
          ElevatedButton(
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
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }
}