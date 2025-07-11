//============================================ Before Update UI by DeepSeek ai ========================
/*
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/error_page.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_screen.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizBottomSheet extends StatefulWidget {
  final String title;
  final int id;

  const QuizBottomSheet({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  State<QuizBottomSheet> createState() => _QuizBottomSheetState();
}

class _QuizBottomSheetState extends State<QuizBottomSheet> {
  int? selectedNumber;
  String? selectedDifficulty;
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: globalKey,
      body: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          if (provider.errorTitle.isNotEmpty) {
            return ErrorPage(
              errorTitle: provider.errorTitle,
              errorMessage: provider.errorMessage,
              onRetry: () {
                provider.errorTitle = '';
                provider.errorMessage = '';
                _startQuiz();
              },
            );
          }

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "Select Total Number of Questions",
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildNumberQuestion(10),
                    _buildNumberQuestion(20),
                    _buildNumberQuestion(30),
                    _buildNumberQuestion(40),
                    _buildNumberQuestion(50),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Select Difficulty",
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildDifficultyQuestion("Any"),
                    _buildDifficultyQuestion("Easy"),
                    _buildDifficultyQuestion("Medium"),
                    _buildDifficultyQuestion("Hard"),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: scheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: _startQuiz,
                    child: Text(
                      "Start Quiz",
                      style: textTheme.labelLarge?.copyWith(
                        color: scheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNumberQuestion(int number) {
    final scheme = Theme.of(context).colorScheme;
    final bool isSelected = selectedNumber == number;

    return InkWell(
      onTap: () {
        setState(() {
          selectedNumber = number;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
          ? scheme.primaryContainer
          : scheme.surfaceContainerHighest,
        ),
        child: Text(
          number.toString(),
          style: TextStyle(
            color: isSelected
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyQuestion(String difficulty) {
    final scheme = Theme.of(context).colorScheme;
    final isSelected = selectedDifficulty == difficulty;

    return InkWell(
      onTap: () {
        setState(() {
          selectedDifficulty = difficulty;
        });
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? scheme.primaryContainer
              : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            difficulty,
            style: TextStyle(
              color: isSelected
                  ? scheme.onPrimaryContainer
                  : scheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startQuiz() async {
    if (selectedDifficulty == null || selectedNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both options!'),
          duration: Duration(milliseconds: 800),
        ),
      );
      return;
    }

    final provider = Provider.of<QuestionProvider>(context, listen: false);
    provider.setLoading(true);

    try {
      final questions = await provider.getDataQuestion(
        selectedDifficulty!.toLowerCase(),
        selectedNumber!,
        widget.id,
      );

      if (mounted) {
        if (questions.isEmpty) {
          buildDialog(
            context,
            "No Questions Found",
            provider.errorMessage.isNotEmpty
                ? provider.errorMessage
                : "This category doesn't contain any questions yet.",
            DialogType.error,
                () => Navigator.pop(context),
                () => null,
          );
        } else {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(
                difficult: selectedDifficulty!,
                id: widget.id,
                listQuestion: questions,
              ),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        provider.setLoading(false);
      }
    }
  }
}
*/


//============================================ After Update UI by DeepSeek ai ========================

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/question_provider.dart';
import 'package:roqsal_quizapp_2026/screen/error_page.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_screen.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../widget/awesomedialog.dart';

class QuizBottomSheet extends StatefulWidget {
  final String title;
  final int id;

  const QuizBottomSheet({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  State<QuizBottomSheet> createState() => _QuizBottomSheetState();
}

class _QuizBottomSheetState extends State<QuizBottomSheet> {
  int? selectedNumber;
  String? selectedDifficulty;
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      key: globalKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer.withOpacity(0.1),
              colorScheme.surfaceContainer.withOpacity(0.3),
            ],
          ),
        ),
        child: Consumer<QuestionProvider>(
          builder: (context, provider, child) {
            if (provider.errorTitle.isNotEmpty) {
              return ErrorPage(
                errorTitle: provider.errorTitle,
                errorMessage: provider.errorMessage,
                onRetry: () {
                  provider.errorTitle = '';
                  provider.errorMessage = '';
                  _startQuiz();
                },
              );
            }

            if (provider.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Select Total Number of Questions",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildNumberQuestion(10, colorScheme),
                      _buildNumberQuestion(20, colorScheme),
                      _buildNumberQuestion(30, colorScheme),
                      _buildNumberQuestion(40, colorScheme),
                      _buildNumberQuestion(50, colorScheme),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Select Difficulty",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildDifficultyQuestion("Any", colorScheme),
                      _buildDifficultyQuestion("Easy", colorScheme),
                      _buildDifficultyQuestion("Medium", colorScheme),
                      _buildDifficultyQuestion("Hard", colorScheme),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //backgroundColor: colorScheme.primary,
                        backgroundColor:   colorScheme.primary.withOpacity(0.8),
                        //foregroundColor: colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      onPressed: _startQuiz,
                      child: Text(
                        "Start Quiz",
                        style:  TextStyle(color: colorScheme.onPrimary),

                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNumberQuestion(int number, ColorScheme colorScheme) {
    final bool isSelected = selectedNumber == number;

    return InkWell(
      onTap: () => setState(() => selectedNumber = number),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ?  colorScheme.primary.withOpacity(0.8)//colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,

        ),
        child: Text(
          number.toString(),
          style: TextStyle(
            color: isSelected
                // ? colorScheme.onPrimaryContainer
                // : colorScheme.onSurfaceVariant,
                ? colorScheme.surface
                : colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyQuestion(String difficulty, ColorScheme colorScheme) {
    final isSelected = selectedDifficulty == difficulty;

    return InkWell(
      onTap: () => setState(() => selectedDifficulty = difficulty),
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ?  colorScheme.primary.withOpacity(0.8)//colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            difficulty,
            style: TextStyle(
              color: isSelected
                  // ? colorScheme.onPrimaryContainer
                  // : colorScheme.onSurfaceVariant,
                  ? colorScheme.surface
                  : colorScheme.onSurface,

              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startQuiz() async {
    if (selectedDifficulty == null || selectedNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select both options!'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final provider = Provider.of<QuestionProvider>(context, listen: false);
    provider.setLoading(true);

    try {
      final questions = await provider.getDataQuestion(
        selectedDifficulty!.toLowerCase(),
        selectedNumber!,
        widget.id,
      );

      if (mounted) {
        if (questions.isEmpty) {
          buildDialog(
            context,
            "No Questions Found",
            provider.errorMessage.isNotEmpty
                ? provider.errorMessage
                : "This category doesn't contain any questions yet.",
            DialogType.error,
                () => Navigator.pop(context),
                () => null,
          );
        } else {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(
                difficult: selectedDifficulty!,
                id: widget.id,
                listQuestion: questions,
              ),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        provider.setLoading(false);
      }
    }
  }
}