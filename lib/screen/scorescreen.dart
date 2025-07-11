//======================================= Befor Update UI by DeepSeek Ai =================================

/*
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';
import 'package:roqsal_quizapp_2026/provider/score_provider.dart';
import 'package:roqsal_quizapp_2026/widget/awesomedialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widget/AppBarcustom.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ScoreProvider>(context, listen: false).getAllScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: const QuizAppBar(title: "History Point"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.background,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Consumer<ScoreProvider>(
                  builder: (context, scoreProvider, _) {
                    if (scoreProvider.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                        ),
                      );
                    }

                    if (scoreProvider.arrScore.isEmpty) {
                      return _buildEmptyState(colorScheme);
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        await scoreProvider.getAllScore();
                      },
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: scoreProvider.arrScore.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final score = scoreProvider.arrScore[index];
                          return _buildScoreCard(scoreProvider, score, colorScheme);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/topic/empty.jpg',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            "No scores found",
            style: TextStyle(
              color: colorScheme.onSurface.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Provider.of<ScoreProvider>(context, listen: false).getAllScore();
            },
            child: Text(
              "Refresh",
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(ScoreProvider provider, Score score, ColorScheme colorScheme) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    score.nameUser,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildScoreDetailRow("Quiz:", score.categories, colorScheme),
                  _buildScoreDetailRow("Questions:", "${score.totalAnswer}/${score.totalQuestion}", colorScheme),
                  _buildScoreDetailRow("Date:", score.date, colorScheme),
                  _buildScoreDetailRow("Score:", "${score.score}%", colorScheme),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: colorScheme.error),
                  onPressed: () => _showDeleteDialog(provider, score.id!),
                ),
                const SizedBox(height: 8),
                CircularPercentIndicator(
                  radius: 40,
                  lineWidth: 8,
                  percent: score.score / 100,
                  center: Text(
                    "${score.score}%",
                    style: TextStyle(fontSize: 12, color: colorScheme.onSurface),
                  ),
                  progressColor: _getScoreColor(score.score),
                  backgroundColor: Colors.grey[200]!,
                  animation: true,
                  animationDuration: 1000,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreDetailRow(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurface,
          ),
          children: [
            TextSpan(
              text: "$label ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(ScoreProvider provider, int id) {
    buildDialog(
      context,
      "Delete Score",
      "Are you sure you want to delete this score record?",
      DialogType.warning,
          () {
        provider.deleteScore(id);
        Navigator.pop(context);
      },
          () => Navigator.pop(context),
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 80) return Colors.green;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }
}
*/


//=================================== After Update UI by DeepSeek Ai ===========================
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';
import 'package:roqsal_quizapp_2026/provider/score_provider.dart';
import 'package:roqsal_quizapp_2026/widget/awesomedialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widget/AppBarcustom.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ScoreProvider>(context, listen: false).getAllScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: const QuizAppBar(title: "Score History"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer.withOpacity(0.2),
              colorScheme.background,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Consumer<ScoreProvider>(
                  builder: (context, scoreProvider, _) {
                    if (scoreProvider.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                        ),
                      );
                    }

                    if (scoreProvider.arrScore.isEmpty) {
                      return _buildEmptyState(colorScheme, textTheme);
                    }

                    return RefreshIndicator(
                      color: colorScheme.primary,
                      onRefresh: () async {
                        await scoreProvider.getAllScore();
                      },
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: scoreProvider.arrScore.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final score = scoreProvider.arrScore[index];
                          return _buildScoreCard(scoreProvider, score, colorScheme, textTheme);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assessment_outlined,
            size: 80,
            color: colorScheme.onSurface.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          Text(
            "No scores yet",
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Complete quizzes to see your score history here",
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              Provider.of<ScoreProvider>(context, listen: false).getAllScore();
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(ScoreProvider provider, Score score, ColorScheme colorScheme, TextTheme textTheme) {
    final scoreColor = _getScoreColor(score.score, colorScheme);

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Score visualization
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: scoreColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: CircularPercentIndicator(
                radius: 36,
                lineWidth: 6,
                percent: score.score / 100,
                center: Text(
                  "${score.score}%",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: scoreColor,
                  ),
                ),
                progressColor: scoreColor,
                backgroundColor: Colors.transparent,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),

            const SizedBox(width: 16),

            // Score details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          score.nameUser,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, size: 20),
                        color: colorScheme.error,
                        onPressed: () => _showDeleteDialog(provider, score.id!),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Quiz info
                  Row(
                    children: [
                      Icon(
                        Icons.quiz_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          score.categories,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Questions info
                  Row(
                    children: [
                      Icon(
                        Icons.question_answer_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${score.totalAnswer} / ${score.totalQuestion} questions",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Date info
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        score.date,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(ScoreProvider provider, int id) {
    buildDialog(
      context,
      "Delete Score Record",
      "Are you sure you want to delete this score record? This action cannot be undone.",
      DialogType.warning,
          () {
        provider.deleteScore(id);
        Navigator.pop(context);
      },
          () => Navigator.pop(context),
    );
  }

  Color _getScoreColor(int score, ColorScheme colorScheme) {
    if (score >= 80) return colorScheme.tertiary;
    if (score >= 50) return colorScheme.secondary;
    return colorScheme.error;
  }
}

