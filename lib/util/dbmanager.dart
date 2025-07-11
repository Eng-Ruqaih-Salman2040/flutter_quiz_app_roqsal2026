import 'dart:async';
import 'package:path/path.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:sqflite/sqflite.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';

class DbManager {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'quiz_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create scores table
    await db.execute('''
      CREATE TABLE scores(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameUser TEXT,
        categories TEXT,
        score INTEGER,
        date TEXT,
        totalAnswer INTEGER,
        totalQuestion INTEGER
      )
    ''');

    // Create bookmarks table
    await db.execute('''
      CREATE TABLE bookmarks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT UNIQUE,
        correctAnswer TEXT,
        incorrectAnswers TEXT,
        category TEXT,
        difficulty TEXT,
        timestamp INTEGER
      )
    ''');
  }

  // Bookmark methods
  Future<int> addBookmark(Question question) async {
    final db = await database;
    return await db.insert(
      'bookmarks',
      {
        'question': question.question,
        'correctAnswer': question.correctAnswer,
        'incorrectAnswers': question.incorrectAnswers.join('|||'),
        'category': question.category,
        'difficulty': question.difficulty,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> removeBookmark(String question) async {
    final db = await database;
    return await db.delete(
      'bookmarks',
      where: "question = ?",
      whereArgs: [question],
    );
  }

  Future<List<Question>> getBookmarks() async {
    final db = await database;
    final res = await db.query('bookmarks');
    return res.map((e) {
      return Question(
        category: e['category'] as String? ?? '',
        type: '', // Add type if needed
        difficulty: e['difficulty'] as String? ?? '',
        question: e['question'] as String? ?? '',
        correctAnswer: e['correctAnswer'] as String? ?? '',
        incorrectAnswers: (e['incorrectAnswers'] as String).split('|||'),
      );
    }).toList();
  }

  // Score methods
  Future<int> addUserScore(Score score) async {
    final db = await database;
    return await db.insert('scores', score.toJson());
  }

  Future<int> deleteScore(int id) async {
    final db = await database;
    return await db.delete(
      'scores',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Score>> getUserScore() async {
    final db = await database;
    final res = await db.query('scores');
    return res.map((e) => Score.fromJson(e)).toList();
  }

  // Data clearing methods for logout
  Future<void> clearAllBookmarks() async {
    final db = await database;
    await db.delete('bookmarks');
  }

  Future<void> clearAllScores() async {
    final db = await database;
    await db.delete('scores');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}