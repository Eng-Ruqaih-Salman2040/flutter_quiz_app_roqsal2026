import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';
import 'package:roqsal_quizapp_2026/util/dbmanager.dart';

class ScoreProvider with ChangeNotifier {
  final DbManager dbManager = DbManager();
  List<Score> arrScore = [];
  bool isLoading = false;
  String error = '';

  Future<void> addScore(
      String nameUser,
      String categories,
      int score,
      String date,
      int totalAnswer,
      int totalQuestion,
      ) async {
    isLoading = true;
    notifyListeners();

    try {
      final Score scoreObj = Score(
        nameUser: nameUser,
        categories: categories,
        score: score,
        date: date,
        totalAnswer: totalAnswer,
        totalQuestion: totalQuestion,
      );
      await dbManager.addUserScore(scoreObj);
      await getAllScore();
    } catch (e) {
      error = "Failed to add score: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteScore(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      await dbManager.deleteScore(id);
      arrScore.removeWhere((score) => score.id == id);
    } catch (e) {
      error = "Failed to delete score: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Score>> getAllScore() async {
    isLoading = true;
    notifyListeners();

    try {
      arrScore = await dbManager.getUserScore();
      return arrScore;
    } catch (e) {
      error = "Failed to load scores: $e";
      return [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetAllScores() async {
    try {
      isLoading = true;
      notifyListeners();
      await dbManager.clearAllScores(); // You'll need to implement this in DbManager
      arrScore.clear();
    } catch (e) {
      error = "Failed to reset scores: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}