
// class Question {
//   final String category;
//   final String type;
//   final String difficulty;
//   final String question;
//   final String correctAnswer;
//   final List<String> incorrectAnswers;
//   bool isBookmarked = false;
//
//   Question({
//     required this.category,
//     required this.type,
//     required this.difficulty,
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//   });
//
//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       category: json['category'] as String,
//       type: json['type'] as String,
//       difficulty: json['difficulty'] as String,
//       question: json['question'] as String,
//       correctAnswer: json['correct_answer'] as String,
//       incorrectAnswers: List<String>.from(json['incorrect_answers']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'category': category,
//       'type': type,
//       'difficulty': difficulty,
//       'question': question,
//       'correct_answer': correctAnswer,
//       'incorrect_answers': incorrectAnswers,
//     };
//   }
// }


/*class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  bool isBookmarked;

  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    this.isBookmarked = false,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: json['category'] as String,
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      isBookmarked: json['isBookmarked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
      'isBookmarked': isBookmarked,
    };
  }

  Question copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    bool? isBookmarked,
  }) {
    return Question(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}*/

class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        category: json['category'] as String? ?? '',
        type: json['type'] as String? ?? '',
        difficulty: json['difficulty'] as String? ?? '',
        question: json['question'] as String? ?? '',
        correctAnswer: json['correct_answer'] as String? ?? '',
        incorrectAnswers: List<String>.from(
        (json['incorrect_answers'] as List<dynamic>? ?? []),
        ) );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }
}
