import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/util/dbmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkProvider with ChangeNotifier {
  final DbManager dbManager = DbManager();
  List<Question> bookmarks = [];
  bool isLoading = false;

  Future<void> toggleBookmark(Question question) async {
    try {
      if (isBookmarked(question.question)) {
        await removeBookmark(question.question);
      } else {
        await addBookmark(question);
      }
      await loadBookmarks();
    } catch (e) {
      debugPrint('Error toggling bookmark: $e');
      rethrow;
    }
  }

  Future<void> addBookmark(Question question) async {
    isLoading = true;
    notifyListeners();
    try {
      await dbManager.addBookmark(question);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeBookmark(String question) async {
    isLoading = true;
    notifyListeners();
    try {
      await dbManager.removeBookmark(question);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadBookmarks() async {
    isLoading = true;
    notifyListeners();
    try {
      bookmarks = await dbManager.getBookmarks();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isBookmarked(String question) {
    return bookmarks.any((b) => b.question == question);
  }

  Future<void> clearAllBookmarks() async {
    try {
      isLoading = true;
      notifyListeners();
      await dbManager.clearAllBookmarks(); // You'll need to implement this in DbManager
      bookmarks.clear();
    } catch (e) {
      debugPrint('Error clearing bookmarks: $e');
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  deleteAllBookmarks() {}

}
// This code defines a BookmarkProvider class that manages bookmarks for questions in a quiz app.