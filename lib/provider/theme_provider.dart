


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/theme/appTheme.dart';

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