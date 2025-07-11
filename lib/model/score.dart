class Score {
  final int? id;
  final String nameUser;
  final String categories;
  final int score;
  final String date;
  final int totalAnswer;
  final int totalQuestion;

  Score({
     this.id,
    required this.nameUser,
    required this.categories,
    required this.score,
    required this.date,
    required this.totalAnswer,
    required this.totalQuestion,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      id: json['id'] as int,
      nameUser: json['nameUser'] as String,
      categories: json['categories'] as String,
      score: json['score'] as int,
      date: json['date'] as String,
      totalAnswer: json['totalAnswer'] as int,
      totalQuestion: json['totalQuestion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameUser': nameUser,
      'categories': categories,
      'score': score,
      'date': date,
      'totalAnswer': totalAnswer,
      'totalQuestion': totalQuestion,
    };
  }
}
