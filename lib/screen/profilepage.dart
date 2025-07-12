/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/screen/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String? imagePath;

  const ProfileScreen({
    super.key,
    required this.userName,
    this.imagePath,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _email;
  String? _universityId;
  int _totalQuizzes = 0;
  int _correctAnswers = 0;
  double _successRate = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email');
      _universityId = prefs.getString('universityId');
      _totalQuizzes = prefs.getInt('totalQuizzes') ?? 0;
      _correctAnswers = prefs.getInt('correctAnswers') ?? 0;
      _successRate = _totalQuizzes > 0
          ? (_correctAnswers / _totalQuizzes * 100)
          : 0.0;
      _isLoading = false;
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/onboarding',
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: textTheme.titleLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: colorScheme.onSurface),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(
                    userName: widget.userName,
                    imagePath: widget.imagePath,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: colorScheme.surfaceVariant,
                  backgroundImage: widget.imagePath != null
                      ? FileImage(File(widget.imagePath!))
                      : null,
                  child: widget.imagePath == null
                      ? Icon(
                    Icons.person,
                    size: 50,
                    color: colorScheme.onSurfaceVariant,
                  )
                      : null,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                    onPressed: () {
                      // Handle edit profile image
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.userName,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_email != null) ...[
              const SizedBox(height: 8),
              Text(
                _email!,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 30),
            // Stats Card
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: colorScheme.surfaceContainerHigh,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (_universityId != null)
                      _buildInfoRow(
                        context,
                        icon: Icons.badge,
                        label: 'University ID',
                        value: _universityId!,
                      ),
                    if (_universityId != null)
                      const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.quiz,
                      label: 'Total Quizzes',
                      value: _totalQuizzes.toString(),
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.check_circle,
                      label: 'Correct Answers',
                      value: '$_correctAnswers/$_totalQuizzes',
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.leaderboard,
                      label: 'Success Rate',
                      value: '${_successRate.toStringAsFixed(1)}%',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Progress Section
            Text(
              'Learning Progress',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _successRate / 100,
                minHeight: 12,
                backgroundColor: colorScheme.surfaceVariant,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${_successRate.toStringAsFixed(1)}% Mastery',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 40),
            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle edit profile
                },
                icon: const Icon(Icons.edit, size: 20),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout, size: 20),
                label: const Text('Log Out'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: colorScheme.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
      }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/



// ======================== PROFILE SCREEN ========================
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/screen/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String? imagePath;

  const ProfileScreen({
    super.key,
    required this.userName,
    this.imagePath,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _email;
  String? _universityId;
  int _totalQuizzes = 0;
  int _correctAnswers = 0;
  double _successRate = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email');
      _universityId = prefs.getString('universityId');
      _totalQuizzes = prefs.getInt('totalQuizzes') ?? 0;
      _correctAnswers = prefs.getInt('correctAnswers') ?? 0;
      _successRate = _totalQuizzes > 0
          ? (_correctAnswers / _totalQuizzes * 100)
          : 0.0;
      _isLoading = false;
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/onboarding',
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: textTheme.titleLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: colorScheme.onSurface),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(
                    userName: widget.userName,
                    imagePath: widget.imagePath,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: colorScheme.surfaceVariant,
                  backgroundImage: widget.imagePath != null
                      ? FileImage(File(widget.imagePath!))
                      : null,
                  child: widget.imagePath == null
                      ? Icon(
                    Icons.person,
                    size: 50,
                    color: colorScheme.onSurfaceVariant,
                  )
                      : null,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                    onPressed: () {
                      // Handle edit profile image
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.userName,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_email != null) ...[
              const SizedBox(height: 8),
              Text(
                _email!,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 30),
            // Stats Card
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: colorScheme.surfaceContainerHigh,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (_universityId != null)
                      _buildInfoRow(
                        context,
                        icon: Icons.badge,
                        label: 'University ID',
                        value: _universityId!,
                      ),
                    if (_universityId != null)
                      const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.quiz,
                      label: 'Total Quizzes',
                      value: _totalQuizzes.toString(),
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.check_circle,
                      label: 'Correct Answers',
                      value: '$_correctAnswers/$_totalQuizzes',
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      context,
                      icon: Icons.leaderboard,
                      label: 'Success Rate',
                      value: '${_successRate.toStringAsFixed(1)}%',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Progress Section
            Text(
              'Learning Progress',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _successRate / 100,
                minHeight: 12,
                backgroundColor: colorScheme.surfaceVariant,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${_successRate.toStringAsFixed(1)}% Mastery',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 40),
            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle edit profile
                },
                icon: const Icon(Icons.edit, size: 20),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout, size: 20),
                label: const Text('Log Out'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: colorScheme.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
      }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
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

