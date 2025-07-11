//------------------------------------ Correct But Not Handling Errors --------------------------------
/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/service/api_service.dart';

class QuestionProvider with ChangeNotifier {
  final API_Service api = API_Service();
  List<Question> listQuestion = [];
  bool _isLoading = false;
  String error = '';
  int currentIndex = 0;
  Map<int, dynamic> answer = {};

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void initValue() {
    listQuestion = [];
    _isLoading = false;
    error = '';
    currentIndex = 0;
    answer = {};
    notifyListeners();
  }

  Future<List<Question>> getDataQuestion(
      String difficulty,
      int totalQuestion,
      int categoriesId,
      ) async {
    setLoading(true);
    error = '';

    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        "${api.baseURL}?amount=$totalQuestion&category=$categoriesId&difficulty=$difficulty",);

      print("================================== API URL========================================" );
      print(response.data['results']);
      print("================================== API Response========================================" );
      print(response.requestOptions.uri.toString());

      if (response.statusCode == 200) {
        listQuestion = (response.data['results'] as List)
            .map((item) => Question.fromJson(item))
            .toList();
      } else {
        error = "Failed to load questions: Status code ${response.statusCode}";
        print("================================== First : API Error========================================\n" );
        print("Failed to load questions: Status code ${response.statusCode}\n");
        print("======================================================================================\n");
      }
    } catch (e) {
      error = "Error: $e";
      print("================================== Second:  API Error========================================\n" );
      print("Error: $e");
      print("======================================================================================\n");

    } finally {
      setLoading(false);
    }

    return listQuestion;
  }

  void selectRadio(dynamic e) {
    answer[currentIndex] = e;
    notifyListeners();
  }

  void selectQuestion(int index) {
    if (index >= 0 && index < listQuestion.length) {
      currentIndex = index;
      notifyListeners();
    }
  }

  void nextQuestion() {
    if (currentIndex < listQuestion.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }
}*/

//--------------------------------------My Update:  Correct But  Handling Errors --------------------------------
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/service/api_service.dart';

class QuestionProvider with ChangeNotifier {
  final API_Service api = API_Service();
  List<Question> listQuestion = [];
  bool _isLoading = false;
  String errorTitle = '';
  String errorMessage = '';
  int currentIndex = 0;
  int dashboardIndex = 0;
  Map<int, dynamic> answer = {};

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void initValue() {
    listQuestion = [];
    _isLoading = false;
    errorTitle = '';
    errorMessage = '';
    currentIndex = 0;
   dashboardIndex=0;
    answer = {};
    notifyListeners();
  }

  Future<List<Question>> getDataQuestion(
      String difficulty,
      int totalQuestion,
      int categoriesId,
      ) async {
    setLoading(true);
    errorTitle = '';
    errorMessage = '';
    listQuestion = [];

    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        "${api.baseURL}?amount=$totalQuestion&category=$categoriesId&difficulty=$difficulty",
      ).timeout(const Duration(seconds: 10));

      print("====================== API URL ======================");
      print(response.requestOptions.uri.toString());
      print("==================== API Response ===================");
      print(response.data);

      if (response.statusCode == 200) {
        if (response.data['results'] != null && response.data['results'].isNotEmpty) {
          listQuestion = (response.data['results'] as List)
              .map((item) => Question.fromJson(item))
              .toList();
        } else {
          errorTitle = "No Questions Found";
          errorMessage = "This category doesn't contain any questions yet.";
        }
      } else {
        errorTitle = "Server Error";
        errorMessage = "Failed to load questions. Please try again later.";
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        errorTitle = "Connection Timeout";
        errorMessage = "The request took too long. Please check your connection.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorTitle = "No Internet Connection";
        errorMessage = "Please check your internet connection and try again.";
      } else if (e.response != null) {
        errorTitle = "Server Error";
        errorMessage = "An error occurred with the server (${e.response?.statusCode})";
      } else {
        errorTitle = "Unknown Error";
        errorMessage = "An unexpected error occurred. Please try again.";
      }
    } catch (e) {
      errorTitle = "Unexpected Error";
      errorMessage = "Something went wrong. Please try again.";
    } finally {
      setLoading(false);
      notifyListeners();
    }

    return listQuestion;
  }

  void selectRadio(dynamic e) {
    answer[currentIndex] = e;
    notifyListeners();
  }

  void selectQuestion(int index) {
    if (index >= 0 && index < listQuestion.length) {
      currentIndex = index;
      notifyListeners();
    }
  }

  void nextQuestion() {
    if (currentIndex < listQuestion.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }
  void resetAllProgress() {
    currentIndex = 0;
    dashboardIndex = 0;
    answer.clear();
    listQuestion.clear();
    errorTitle = '';
    errorMessage = '';
    notifyListeners();
  }

}