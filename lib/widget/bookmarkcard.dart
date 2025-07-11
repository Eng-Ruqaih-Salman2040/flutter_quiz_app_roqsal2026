import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';

class BookmarkCard extends StatelessWidget {
  final Question question;
  final VoidCallback onDelete;
  final VoidCallback onShare;

  const BookmarkCard({
    super.key,
    required this.question,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final unescape = HtmlUnescape();
/* Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:*/
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category and difficulty chip row
            Row(
              children: [
                _buildInfoChip(
                  context,
                  Icons.category,
                  question.category,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  context,
                  Icons.leaderboard,
                  question.difficulty,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Question with divider
            Text(
              unescape.convert(question.question),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Divider(
              height: 1,
              color: colorScheme.outlineVariant,
            ),
            const SizedBox(height: 12),

            // Options section
            Text(
              'Options:',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 8),

            // Incorrect answers
            ...question.incorrectAnswers.map(
                  (answer) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      size: 16,
                      color: colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        unescape.convert(answer),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Correct answer
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      unescape.convert(question.correctAnswer),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: Icon(
                    Icons.share,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  label: Text(
                    'Share',
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  onPressed: onShare,
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: colorScheme.error,
                  ),
                  label: Text(
                    'Remove',
                    style: TextStyle(
                      color: colorScheme.error,
                    ),
                  ),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Chip(
      avatar: Icon(
        icon,
        size: 16,
        color: colorScheme.onSurfaceVariant,
      ),
      label: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      backgroundColor: colorScheme.surfaceContainerHighest,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}