//=================================== Befor Update UI by DeepSeek Ai ===========================



//=========================================== Updated ProgressPage DeepSeek Ai =================================

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';
import 'package:roqsal_quizapp_2026/provider/score_provider.dart';
import '../widget/AppBarcustom.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int _selectedTimeFilter = 0; // 0 = All, 1 = Monthly, 2 = Weekly
  final List<String> _timeFilters = ['All Time', 'Last 30 Days', 'Last 7 Days'];

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
      appBar: const QuizAppBar(title: 'Progress Dashboard'),
      body: Consumer<ScoreProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return _buildLoadingState(colorScheme, textTheme);
          }

          if (provider.arrScore.isEmpty) {
            return _buildEmptyState(colorScheme, textTheme);
          }

          // Filter scores based on time selection
          final filteredScores = _filterScores(provider.arrScore);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time filter selector
                _buildTimeFilterSelector(colorScheme, textTheme),
                const SizedBox(height: 24),

                // Performance overview cards
                _buildPerformanceOverview(context, filteredScores),
                const SizedBox(height: 24),

                // Progress chart
                _buildProgressChart(context, filteredScores),
                const SizedBox(height: 24),

                // Insights section
                _buildInsightsSection(context, filteredScores),
                const SizedBox(height: 24),

                // Recent attempts
                _buildRecentAttemptsList(context, filteredScores),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(colorScheme.primary),
          ),
          const SizedBox(height: 16),
          Text(
            'Analyzing your progress...',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 80,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            'No progress data available',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Complete quizzes to track your learning progress',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Provider.of<ScoreProvider>(context, listen: false).getAllScore();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text('Refresh Data'),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilterSelector(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time Range',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(_timeFilters.length, (index) {
            return ChoiceChip(
              label: Text(_timeFilters[index]),
              selected: _selectedTimeFilter == index,
              onSelected: (selected) {
                setState(() {
                  _selectedTimeFilter = selected ? index : 0;
                });
              },
              selectedColor: colorScheme.primaryContainer,
              backgroundColor: colorScheme.surfaceVariant,
              labelStyle: TextStyle(
                color: _selectedTimeFilter == index
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurface,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPerformanceOverview(BuildContext context, List<Score> scores) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final averageScore = scores.map((e) => e.score).reduce((a, b) => a + b) / scores.length;
    final highestScore = scores.map((e) => e.score).reduce((a, b) => a > b ? a : b);
    final lastScore = scores.last.score;
    final improvement = lastScore - (scores.length > 1 ? scores[scores.length - 2].score : 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Overview',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.4,
          children: [
            _buildStatCard(
                context,
                'Average Score',
                '${averageScore.toStringAsFixed(1)}%',
                Icons.bar_chart,
                Colors.blue
            ),
            _buildStatCard(
                context,
                'Highest Score',
                '$highestScore%',
                Icons.star,
                Colors.amber
            ),
            _buildStatCard(
                context,
                'Last Attempt',
                '$lastScore%',
                Icons.history,
                Colors.green
            ),
            _buildStatCard(
                context,
                improvement >= 0 ? 'Improvement' : 'Decline',
                '${improvement >= 0 ? '+' : ''}${improvement.toStringAsFixed(1)}%',
                improvement >= 0 ? Icons.trending_up : Icons.trending_down,
                improvement >= 0 ? Colors.green : Colors.red
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20, color: color),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressChart(BuildContext context, List<Score> scores) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Sort scores by date (newest first)
    scores.sort((a, b) => b.date.compareTo(a.date));

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Score Trend',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.circle, size: 12, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    'Your Score',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 20,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: colorScheme.outlineVariant.withOpacity(0.1),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 && value.toInt() < scores.length) {
                          final date = scores[value.toInt()].date.split(' ')[0];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              date,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                      reservedSize: 32,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        '${value.toInt()}%',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      reservedSize: 32,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                ),
                minX: 0,
                maxX: (scores.length - 1).toDouble(),
                minY: 0,
                maxY: 100,
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final score = scores[spot.x.toInt()];
                        return LineTooltipItem(
                          '${score.score}%\n${score.categories}\n${score.date}',
                          TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '\n${score.nameUser}',
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                    //tooltipBgColor: colorScheme.surface,
                    tooltipBorder: BorderSide(
                      color: colorScheme.outlineVariant,
                      width: 1,
                    ),
                    tooltipRoundedRadius: 8,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: scores.asMap().entries.map((entry) {
                      return FlSpot(
                        entry.key.toDouble(),
                        entry.value.score.toDouble(),
                      );
                    }).toList(),
                    isCurved: true,
                    color: colorScheme.primary,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: colorScheme.primary,
                          strokeWidth: 2,
                          strokeColor: colorScheme.onPrimary,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withOpacity(0.3),
                          colorScheme.primary.withOpacity(0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                'Tap on data points for details',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsSection(BuildContext context, List<Score> scores) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Calculate insights
    final completedQuizzes = scores.length;
    final bestCategory = _getBestCategory(scores);
    final improvement = scores.isNotEmpty ? scores.last.score - scores.first.score : 0;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Insights',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),

          // Insights chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPerformanceChip(
                  context,
                  icon: Icons.library_books,
                  label: '$completedQuizzes ${completedQuizzes == 1 ? 'Quiz' : 'Quizzes'}',
                  color: Colors.blue
              ),
              _buildPerformanceChip(
                  context,
                  icon: Icons.emoji_events,
                  label: bestCategory.isNotEmpty ? 'Best: $bestCategory' : 'No category data',
                  color: Colors.amber
              ),
              _buildPerformanceChip(
                  context,
                  icon: improvement >= 0 ? Icons.trending_up : Icons.trending_down,
                  label: '${improvement >= 0 ? '+' : ''}${improvement.toStringAsFixed(1)}% overall',
                  color: improvement >= 0 ? Colors.green : Colors.red
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Progress message
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _getProgressMessage(scores),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChip(BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAttemptsList(BuildContext context, List<Score> scores) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final recentScores = scores.length > 5 ? scores.sublist(0, 5) : scores;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Attempts',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                '${scores.length} total',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...recentScores.map((score) => _buildAttemptItem(context, score)).toList(),
        ],
      ),
    );
  }

  Widget _buildAttemptItem(BuildContext context, Score score) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color scoreColor;
    if (score.score >= 80) {
      scoreColor = colorScheme.tertiary;
    } else if (score.score >= 50) {
      scoreColor = colorScheme.secondary;
    } else {
      scoreColor = colorScheme.error;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Score indicator
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: scoreColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: score.score / 100,
                  backgroundColor: Colors.transparent,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
                ),
                Center(
                  child: Text(
                    '${score.score}',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: scoreColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Quiz details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  score.categories,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      score.date,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.question_answer,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${score.totalAnswer}/${score.totalQuestion}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Performance indicator
          Icon(
            score.score >= 80
                ? Icons.emoji_events
                : score.score >= 50
                ? Icons.check_circle
                : Icons.warning,
            color: scoreColor,
          ),
        ],
      ),
    );
  }

  // Helper functions
  List<Score> _filterScores(List<Score> scores) {
    final now = DateTime.now();

    switch (_selectedTimeFilter) {
      case 1: // Last 30 days
        return scores.where((score) {
          final date = DateTime.parse(score.date);
          return now.difference(date).inDays <= 30;
        }).toList();
      case 2: // Last 7 days
        return scores.where((score) {
          final date = DateTime.parse(score.date);
          return now.difference(date).inDays <= 7;
        }).toList();
      default:
        return scores;
    }
  }

  String _getBestCategory(List<Score> scores) {
    if (scores.isEmpty) return '';

    final categoryScores = <String, List<int>>{};

    for (final score in scores) {
      if (categoryScores.containsKey(score.categories)) {
        categoryScores[score.categories]!.add(score.score);
      } else {
        categoryScores[score.categories] = [score.score];
      }
    }

    String bestCategory = '';
    double highestAverage = 0;

    categoryScores.forEach((category, scores) {
      final average = scores.reduce((a, b) => a + b) / scores.length;
      if (average > highestAverage) {
        highestAverage = average;
        bestCategory = category;
      }
    });

    return bestCategory;
  }

  String _getProgressMessage(List<Score> scores) {
    if (scores.isEmpty) return 'Complete your first quiz to start tracking progress!';

    final lastScore = scores.last.score;
    final firstScore = scores.first.score;
    final improvement = lastScore - firstScore;

    if (scores.length == 1) {
      return 'Great start! Complete more quizzes to see your progress over time.';
    }

    if (improvement > 10) {
      return 'Impressive progress! Your scores have increased by ${improvement.toStringAsFixed(1)}% since you started.';
    } else if (improvement > 0) {
      return 'You\'re making steady progress. Keep practicing to see bigger improvements!';
    } else if (improvement < 0) {
      return 'Your recent scores are lower than when you started. Try reviewing previous quizzes.';
    }

    return 'Your performance is consistent. Challenge yourself with more difficult quizzes!';
  }
}