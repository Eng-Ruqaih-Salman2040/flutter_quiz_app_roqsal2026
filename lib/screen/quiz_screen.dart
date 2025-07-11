//===============================Correct Quiz Screen with shar and bookmark icons ============================
/*
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizPage extends StatefulWidget {
  final List<Question> listQuestion;
  final int id;
  final String difficult;

  const QuizPage({
    Key? key,
    required this.listQuestion,
    required this.id,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final HtmlUnescape htmlUnescape = HtmlUnescape();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kItemSelectBottomNav,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => _onBackPressed(),
          ),
          title: Column(
            children: [
              Text(
                widget.listQuestion[widget.id].category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Difficulty: ${widget.difficult}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            Consumer<QuestionProvider>(
              builder: (context, provider, _) {
                return IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () => _shareCurrentQuestion(
                    widget.listQuestion[provider.currentIndex],
                  ),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: kItemSelectBottomNav,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<QuestionProvider>(
                builder: (context, provider, _) {
                  final currentQuestion = widget.listQuestion[provider.currentIndex];
                  final options = _getShuffledOptions(currentQuestion);

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      //_buildQuestionProgress(provider),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildQuestionCard(currentQuestion),
                              const SizedBox(height: 20),
                              _buildOptionsList(options, provider, currentQuestion),
                            ],
                          ),
                        ),
                      ),
                      _buildNavigationButtons(provider),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionProgress(QuestionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Question ${provider.currentIndex + 1}/${widget.listQuestion.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Consumer<BookmarkProvider>(
            builder: (context, bookmarkProvider, _) {
              final currentQuestion = widget.listQuestion[provider.currentIndex];
              return
              //   IconButton(
              //   icon: Icon(
              //     bookmarkProvider.isBookmarked(currentQuestion.question)
              //         ? Icons.bookmark
              //         : Icons.bookmark_border,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {
              //     bookmarkProvider.toggleBookmark(currentQuestion);
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(
              //           bookmarkProvider.isBookmarked(currentQuestion.question)
              //               ? 'Question bookmarked'
              //               : 'Bookmark removed',
              //         ),
              //         duration: const Duration(seconds: 1),
              //       ),
              //     );
              //   },
              // );
                IconButton(
                  icon: Icon(
                    bookmarkProvider.isBookmarked(currentQuestion.question)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    try {
                      await bookmarkProvider.toggleBookmark(currentQuestion);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            bookmarkProvider.isBookmarked(currentQuestion.question)
                                ? 'Question bookmarked'
                                : 'Bookmark removed',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to update bookmark'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              htmlUnescape.convert(question.question),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getShuffledOptions(Question question) {
    final options = List<String>.from(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return options;
  }

  Widget _buildOptionsList(List<String> options, QuestionProvider provider, Question currentQuestion) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = provider.answer[provider.currentIndex] == option;
        final isCorrect = option == currentQuestion.correctAnswer;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide(
              color: isCorrect ? Colors.green : Colors.red,
              width: 2,
            )
                : BorderSide.none,
          ),
          child: ListTile(
            title: Text(
              htmlUnescape.convert(option),
              style: TextStyle(
                color: isSelected
                    ? (isCorrect ? Colors.green : Colors.red)
                    : Colors.black,
              ),
            ),
            onTap: () => provider.selectRadio(option),
            trailing: isSelected
                ? Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? Colors.green : Colors.red,
            )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(QuestionProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (provider.currentIndex > 0)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              provider.selectQuestion(provider.currentIndex - 1);
            },
            child: const Text(
              'Previous',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kItemSelectBottomNav,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () {
            if (provider.answer[provider.currentIndex] == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select an answer!'),
                  duration: Duration(seconds: 1),
                ),
              );
              return;
            }

            if (provider.currentIndex == widget.listQuestion.length - 1) {
              _showQuizCompletionDialog();
            } else {
              provider.nextQuestion();
            }
          },
          child: Text(
            provider.currentIndex == widget.listQuestion.length - 1
                ? 'Submit Quiz'
                : 'Next Question',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text('Are you sure you want to leave the quiz? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Exit', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  void _shareCurrentQuestion(Question question) {
    Share.share(
      'Quiz Question:\n\n'
          '${htmlUnescape.convert(question.question)}\n\n'
          'Category: ${question.category}\n'
          'Difficulty: ${question.difficulty}\n\n'
          'Can you answer this?',
      subject: 'Quiz Question Challenge',
    );
  }

  void _showQuizCompletionDialog() {
    final provider = Provider.of<QuestionProvider>(context, listen: false);
    final correctAnswers = provider.answer.entries.where((entry) {
      return widget.listQuestion[entry.key].correctAnswer == entry.value;
    }).length;

    final score = (correctAnswers / widget.listQuestion.length * 100).round();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Quiz Completed!',
      desc: 'You scored $score% (${correctAnswers}/${widget.listQuestion.length} correct answers)',
      btnOkText: 'View Results',
      btnOkColor: kItemSelectBottomNav,
      btnOkOnPress: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => QuizFinishPage(
        //       title: widget.listQuestion[widget.id].category,
        //       answer: provider.answer,
        //       listQuestion: widget.listQuestion,
        //     ),
        //   ),
        // );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizFinishPage(
              title: widget.listQuestion[widget.id].category,
              answer: provider.answer,
              listQuestion: widget.listQuestion,
              //id: widget.id,  // Pass the id
            ),
          ),
        );
      },
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
    ).show();
  }
}*/

//=============================== Correct Quiz Screen with only share  icons ============================
/*import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizPage extends StatefulWidget {
  final List<Question> listQuestion;
  final int id;
  final String difficult;

  const QuizPage({
    Key? key,
    required this.listQuestion,
    required this.id,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final HtmlUnescape htmlUnescape = HtmlUnescape();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kItemSelectBottomNav,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => _onBackPressed(),
          ),
          title: Column(
            children: [
              Text(
                widget.listQuestion[widget.id].category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Difficulty: ${widget.difficult}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            Consumer<QuestionProvider>(
              builder: (context, provider, _) {
                return IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () => _shareCurrentQuestion(
                    widget.listQuestion[provider.currentIndex],
                  ),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: kItemSelectBottomNav,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<QuestionProvider>(
                builder: (context, provider, _) {
                  final currentQuestion = widget.listQuestion[provider.currentIndex];
                  final options = _getShuffledOptions(currentQuestion);

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildQuestionProgress(provider),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildQuestionCard(currentQuestion),
                              const SizedBox(height: 20),
                              _buildOptionsList(options, provider, currentQuestion),
                            ],
                          ),
                        ),
                      ),
                      _buildNavigationButtons(provider),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionProgress(QuestionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Question ${provider.currentIndex + 1}/${widget.listQuestion.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Bookmark icon has been removed from here
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              htmlUnescape.convert(question.question),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getShuffledOptions(Question question) {
    final options = List<String>.from(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return options;
  }

  Widget _buildOptionsList(List<String> options, QuestionProvider provider, Question currentQuestion) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = provider.answer[provider.currentIndex] == option;
        final isCorrect = option == currentQuestion.correctAnswer;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide(
              color: isCorrect ? Colors.green : Colors.red,
              width: 2,
            )
                : BorderSide.none,
          ),
          child: ListTile(
            title: Text(
              htmlUnescape.convert(option),
              style: TextStyle(
                color: isSelected
                    ? (isCorrect ? Colors.green : Colors.red)
                    : Colors.black,
              ),
            ),
            onTap: () => provider.selectRadio(option),
            trailing: isSelected
                ? Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? Colors.green : Colors.red,
            )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(QuestionProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (provider.currentIndex > 0)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              provider.selectQuestion(provider.currentIndex - 1);
            },
            child: const Text(
              'Previous',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kItemSelectBottomNav,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () {
            if (provider.answer[provider.currentIndex] == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select an answer!'),
                  duration: Duration(seconds: 1),
                ),
              );
              return;
            }

            if (provider.currentIndex == widget.listQuestion.length - 1) {
              _showQuizCompletionDialog();
            } else {
              provider.nextQuestion();
            }
          },
          child: Text(
            provider.currentIndex == widget.listQuestion.length - 1
                ? 'Submit Quiz'
                : 'Next Question',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text('Are you sure you want to leave the quiz? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Exit', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  void _shareCurrentQuestion(Question question) {
    Share.share(
      'Quiz Question:\n\n'
          '${htmlUnescape.convert(question.question)}\n\n'
          'Category: ${question.category}\n'
          'Difficulty: ${question.difficulty}\n\n'
          'Can you answer this?',
      subject: 'Quiz Question Challenge',
    );
  }

  void _showQuizCompletionDialog() {
    final provider = Provider.of<QuestionProvider>(context, listen: false);
    final correctAnswers = provider.answer.entries.where((entry) {
      return widget.listQuestion[entry.key].correctAnswer == entry.value;
    }).length;

    final score = (correctAnswers / widget.listQuestion.length * 100).round();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Quiz Completed!',
     // desc: 'You scored $score% (${correctAnswers}/${widget.listQuestion.length} correct answers)',
      desc:"Do you want to see the results?",
      btnOkText: 'View Results',
      btnOkColor: kItemSelectBottomNav,
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizFinishPage(
              title: widget.listQuestion[widget.id].category,
              answer: provider.answer,
              listQuestion: widget.listQuestion,
            ),
          ),
        );
      },
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
    ).show();
  }


}*/


//================================ Correct Quiz Screen without share and old visual style ============================
/*
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizPage extends StatefulWidget {
  final List<Question> listQuestion;
  final int id;
  final String difficult;

  const QuizPage({
    Key? key,
    required this.listQuestion,
    required this.id,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final HtmlUnescape htmlUnescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kItemSelectBottomNav,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => _onBackPressed(),
          ),
          title: Column(
            children: [
              Text(
                widget.listQuestion[widget.id].category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Difficulty: ${widget.difficult}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kItemSelectBottomNav.withOpacity(0.8),
                Colors.white.withOpacity(0.1),
              ],
            ),
          ),
          child: Consumer<QuestionProvider>(
            builder: (context, provider, _) {
              final currentQuestion = widget.listQuestion[provider.currentIndex];
              final options = _getShuffledOptions(currentQuestion);

              return Column(
                children: [
                  _buildQuestionProgress(provider),
                  _buildQuestionCard(currentQuestion),
                  Expanded(
                    child: _buildOptionsList(options, provider),
                  ),
                  _buildNavigationButtons(provider),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionProgress(QuestionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listQuestion.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => provider.selectQuestion(index),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.currentIndex == index
                      ? Colors.white
                      : kItemSelectBottomNav.withOpacity(0.5),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: provider.currentIndex == index
                          ? kItemSelectBottomNav
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              htmlUnescape.convert(question.question),
              style:
              const TextStyle(

                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Question ${widget.listQuestion.indexOf(question) + 1}/${widget.listQuestion.length}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getShuffledOptions(Question question) {
    final options = List<String>.from(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return options;
  }

  Widget _buildOptionsList(List<String> options, QuestionProvider provider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: RadioListTile(
            title: Text(
              htmlUnescape.convert(option),
              style: const TextStyle(fontSize: 16),
            ),
            value: option,
            groupValue: provider.answer[provider.currentIndex],
            onChanged: (value) => provider.selectRadio(value),
            activeColor: kItemSelectBottomNav,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(QuestionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (provider.currentIndex > 0)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                provider.selectQuestion(provider.currentIndex - 1);
              },
              child: const Text(
                'Previous',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kItemSelectBottomNav,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              if (provider.answer[provider.currentIndex] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select an answer!'),
                    duration: Duration(seconds: 1),
                  ),
                );
                return;
              }

              if (provider.currentIndex == widget.listQuestion.length - 1) {
                _showQuizCompletionDialog();
              } else {
                provider.nextQuestion();
              }
            },
            child: Text(
              provider.currentIndex == widget.listQuestion.length - 1
                  ? 'Submit Quiz'
                  : 'Next Question',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldExit = await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Exit Quiz?',
      desc: 'Are you sure you want to leave the quiz? Your progress will be lost.',
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
      btnOkText: 'Exit',
      btnOkColor: Colors.red,
      btnOkOnPress: () => Navigator.pop(context, true),
    ).show().then((value) => value ?? false);

    return shouldExit;
  }

  void _showQuizCompletionDialog() {
    final provider = Provider.of<QuestionProvider>(context, listen: false);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Quiz Completed!',
      desc: 'Do you want to see the results?',
      btnOkText: 'View Results',
      btnOkColor: kItemSelectBottomNav,
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizFinishPage(
              title: widget.listQuestion[widget.id].category,
              answer: provider.answer,
              listQuestion: widget.listQuestion,
            ),
          ),
        );
      },
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
    ).show();
  }
}*/


//================================ Correct Quiz Screen with apply Material 3 theme and share and bookmark icons ============================


import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:roqsal_quizapp_2026/util/theme/extendedColor.dart';
import 'package:roqsal_quizapp_2026/util/theme/material3_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizPage extends StatefulWidget {
  final List<Question> listQuestion;
  final int id;
  final String difficult;

  const QuizPage({
    Key? key,
    required this.listQuestion,
    required this.id,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final HtmlUnescape htmlUnescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;


    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
         //backgroundColor: colorScheme.primaryContainer,
          elevation: 0,


        centerTitle: true,
        // backgroundColor: backgroundColor ?? kItemSelectBottomNav,

        automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                //color: colorScheme.onPrimary
            ),
            onPressed: () => _onBackPressed(),
          ),
          title: Column(
            children: [
              Text(
                widget.listQuestion[widget.id].category,
                style: TextStyle(
                 color: colorScheme.onSurface,
                  fontSize: 25,
                    fontWeight: FontWeight.bold,

                      //kHeadingTextStyleAppBar.copyWith(
                      // color: Colors.white



                    letterSpacing: 1.0
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Difficulty: ${widget.difficult}",
                style: TextStyle(

                  fontSize: 15,
                  fontWeight: FontWeight.normal,

                  // color: colorScheme.onPrimary.withOpacity(0.7),
                ),
              ),
            ],
          ),
          actions: [
            Consumer<QuestionProvider>(
              builder: (context, provider, _) {
                return IconButton(
                  icon: Icon(Icons.share,
                     // color: colorScheme.onPrimary
                  ),
                  onPressed: () => _shareCurrentQuestion(
                    widget.listQuestion[provider.currentIndex],
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.onSecondary.withOpacity(0.8),
                colorScheme.surface.withOpacity(0.1),
              ],
            ),
          ),
          child: Consumer<QuestionProvider>(
            builder: (context, provider, _) {
              final currentQuestion = widget.listQuestion[provider.currentIndex];
              final options = _getShuffledOptions(currentQuestion);

              return Column(
                children: [
                  _buildQuestionProgress(provider, colorScheme),
                  _buildQuestionCard(currentQuestion, theme),
                  Expanded(
                    child: _buildOptionsList(options, provider, colorScheme),
                  ),
                  _buildNavigationButtons(provider, colorScheme),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionProgress(QuestionProvider provider, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listQuestion.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => provider.selectQuestion(index),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.currentIndex == index
                      ? colorScheme.primary.withOpacity(0.8)
                  :colorScheme.surfaceContainerHighest,

                  border: Border.all(color: colorScheme.onPrimary),
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: provider.currentIndex == index
                          ? colorScheme.surface
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              htmlUnescape.convert(question.question),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Question ${widget.listQuestion.indexOf(question) + 1}/${widget.listQuestion.length}",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getShuffledOptions(Question question) {
    final options = List<String>.from(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return options;
  }

  Widget _buildOptionsList(List<String> options, QuestionProvider provider, ColorScheme colorScheme) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: RadioListTile(
            title: Text(
              htmlUnescape.convert(option),
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold
              ),
            ),
            value: option,
            groupValue: provider.answer[provider.currentIndex],
            onChanged: (value) => provider.selectRadio(value),
            activeColor: colorScheme.primary,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(QuestionProvider provider, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (provider.currentIndex > 0)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                provider.selectQuestion(provider.currentIndex - 1);
              },
              child: Text(
                'Previous',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
    backgroundColor:   colorScheme.primary.withOpacity(0.8),
              //backgroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              if (provider.answer[provider.currentIndex] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select an answer!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
                return;
              }

              if (provider.currentIndex == widget.listQuestion.length - 1) {
                _showQuizCompletionDialog(colorScheme);
              } else {
                provider.nextQuestion();
              }
            },
            child: Text(
              provider.currentIndex == widget.listQuestion.length - 1
                  ? 'Submit Quiz'
                  : 'Next Question',
              style: TextStyle(color: colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldExit = await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Exit Quiz?',
      desc: 'Are you sure you want to leave the quiz? Your progress will be lost.',
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
      btnOkText: 'Exit',
      //btnOkColor: Theme.of(context).colorScheme.error,
      btnOkOnPress: () => Navigator.pop(context, true),
    ).show().then((value) => value ?? false);

    return shouldExit;
  }

  void _shareCurrentQuestion(Question question) {
    Share.share(
      'Quiz Question:\n\n'

          'Category: ${question.category}\n'
          'Difficulty: ${question.difficulty}\n\n'
          '${htmlUnescape.convert(question.question)}\n\n'

          'Can you answer this?',
      subject: 'Quiz Question Challenge',
    );
  }

  void _showQuizCompletionDialog(ColorScheme colorScheme) {
    final provider = Provider.of<QuestionProvider>(context, listen: false);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Quiz Completed!',
      //desc: 'You scored $score% (${correctAnswers}/${widget.listQuestion.length} correct answers)',
      desc: 'Do you want to see the results?',
      btnOkText: 'View Results',
      btnOkColor: colorScheme.primary,
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizFinishPage(
              title: widget.listQuestion[widget.id].category,
              answer: provider.answer,
              listQuestion: widget.listQuestion,
            ),
          ),
        );
      },
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
    ).show();
  }
}


//================================= After Update UI by DeepSeek ai 12/7/2025 ==================================
/*
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_finish_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizPage extends StatefulWidget {
  final List<Question> listQuestion;
  final int id;
  final String difficult;

  const QuizPage({
    Key? key,
    required this.listQuestion,
    required this.id,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final HtmlUnescape htmlUnescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackPressed(),
          ),
          title: Column(
            children: [
              Text(
                widget.listQuestion[widget.id].category,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              Text(
                "Difficulty: ${widget.difficult}",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimary.withOpacity(0.8),
                ),
              ),
            ],
          ),
          actions: [
            Consumer<QuestionProvider>(
              builder: (context, provider, _) {
                return IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () => _shareCurrentQuestion(
                    widget.listQuestion[provider.currentIndex],
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primary.withOpacity(0.1),
                colorScheme.surfaceContainer.withOpacity(0.3),
              ],
            ),
          ),
          child: Consumer<QuestionProvider>(
            builder: (context, provider, _) {
              final currentQuestion = widget.listQuestion[provider.currentIndex];
              final options = _getShuffledOptions(currentQuestion);

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildQuestionProgress(provider, colorScheme),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildQuestionCard(currentQuestion, theme),
                            const SizedBox(height: 20),
                            _buildOptionsList(options, provider, currentQuestion, colorScheme),
                          ],
                        ),
                      ),
                    ),
                    _buildNavigationButtons(provider, colorScheme),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionProgress(QuestionProvider provider, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Question ${provider.currentIndex + 1}/${widget.listQuestion.length}",
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(Question question, ThemeData theme) {
    return Card(
      elevation: 4,
      color: theme.colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              htmlUnescape.convert(question.question),
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getShuffledOptions(Question question) {
    final options = List<String>.from(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return options;
  }

  Widget _buildOptionsList(List<String> options, QuestionProvider provider,
      Question currentQuestion, ColorScheme colorScheme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = provider.answer[provider.currentIndex] == option;
        final isCorrect = option == currentQuestion.correctAnswer;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide(
              color: isCorrect ? Colors.green : Colors.red,
              width: 2,
            )
                : BorderSide.none,
          ),
          child: ListTile(
            title: Text(
              htmlUnescape.convert(option),
              style: TextStyle(
                color: isSelected
                    ? (isCorrect ? Colors.green : Colors.red)
                    : colorScheme.onSurface,
              ),
            ),
            onTap: () => provider.selectRadio(option),
            trailing: isSelected
                ? Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? Colors.green : Colors.red,
            )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(QuestionProvider provider, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (provider.currentIndex > 0)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surfaceVariant,
              foregroundColor: colorScheme.onSurfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => provider.selectQuestion(provider.currentIndex - 1),
            child: const Text('Previous'),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () {
            if (provider.answer[provider.currentIndex] == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Please select an answer!'),
                  backgroundColor: colorScheme.error,
                ),
              );
              return;
            }

            if (provider.currentIndex == widget.listQuestion.length - 1) {
              _showQuizCompletionDialog(colorScheme);
            } else {
              provider.nextQuestion();
            }
          },
          child: Text(
            provider.currentIndex == widget.listQuestion.length - 1
                ? 'Submit Quiz'
                : 'Next Question',
          ),
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text('Are you sure you want to leave? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Exit', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  void _shareCurrentQuestion(Question question) {
    Share.share(
      'Quiz Question:\n\n'
          '${htmlUnescape.convert(question.question)}\n\n'
          'Category: ${question.category}\n'
          'Difficulty: ${question.difficulty}\n\n'
          'Can you answer this?',
      subject: 'Quiz Question Challenge',
    );
  }

  void _showQuizCompletionDialog(ColorScheme colorScheme) {
    final provider = Provider.of<QuestionProvider>(context, listen: false);
    final correctAnswers = provider.answer.entries.where((entry) {
      return widget.listQuestion[entry.key].correctAnswer == entry.value;
    }).length;

    final score = (correctAnswers / widget.listQuestion.length * 100).round();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Quiz Completed!',
      desc: 'You scored $score% ($correctAnswers/${widget.listQuestion.length})',
      btnOkText: 'View Results',
      btnOkColor: colorScheme.primary,
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizFinishPage(
              title: widget.listQuestion[widget.id].category,
              answer: provider.answer,
              listQuestion: widget.listQuestion,
            ),
          ),
        );
      },
      btnCancelText: 'Cancel',
      btnCancelOnPress: () {},
    ).show();
  }
}*/
