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
  bool _isLoggingOut = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
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
    } catch (e) {
      setState(() => _isLoading = false);
      // In production, you might want to log this error to a service
      debugPrint('Error loading profile data: $e');
    }
  }

  Future<void> _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out of your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout ?? false) {
      setState(() => _isLoggingOut = true);
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isRegistered', false);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/onboarding',
              (route) => false,
        );
      } catch (e) {
        setState(() => _isLoggingOut = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logout failed. Please try again.')),
        );
      }
    }
  }

  Future<void> _editProfile() async {
    // Placeholder for edit profile functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile coming in next update')),
    );
  }

  Future<void> _changeProfileImage() async {
    // Placeholder for profile image change
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile image change coming soon')),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: textTheme.titleLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: colorScheme.onSurface),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SettingsScreen(
                  userName: widget.userName,
                  imagePath: widget.imagePath,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16 : 24,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: isSmallScreen ? 60 : 72,
                  backgroundColor: colorScheme.surfaceVariant,
                  backgroundImage: widget.imagePath != null
                      ? FileImage(File(widget.imagePath!))
                      : null,
                  child: widget.imagePath == null
                      ? Icon(
                    Icons.person,
                    size: isSmallScreen ? 50 : 64,
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
                      Icons.camera_alt,
                      color: colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                    onPressed: _changeProfileImage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // User Info
            Text(
              widget.userName,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (_email != null) ...[
              const SizedBox(height: 8),
              Text(
                _email!,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 32),

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
                        icon: Icons.badge_outlined,
                        label: 'University ID',
                        value: _universityId!,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    if (_universityId != null)
                      const Divider(height: 24),
                    _buildInfoRow(
                      icon: Icons.quiz_outlined,
                      label: 'Total Quizzes',
                      value: _totalQuizzes.toString(),
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      icon: Icons.check_circle_outline,
                      label: 'Correct Answers',
                      value: '$_correctAnswers/$_totalQuizzes',
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      icon: Icons.leaderboard_outlined,
                      label: 'Success Rate',
                      value: '${_successRate.toStringAsFixed(1)}%',
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Progress Section
            Text(
              'LEARNING PROGRESS',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurfaceVariant,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceVariant,
              ),
              height: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(
                  value: _successRate / 100,
                  minHeight: 16,
                  backgroundColor: Colors.transparent,
                  color: colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${_successRate.toStringAsFixed(1)}% Mastery',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _editProfile,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: FilledButton.styleFrom(
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
                onPressed: _isLoggingOut ? null : _logout,
                icon: _isLoggingOut
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Icon(Icons.logout),
                label: Text(_isLoggingOut ? 'Logging Out...' : 'Log Out'),
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}