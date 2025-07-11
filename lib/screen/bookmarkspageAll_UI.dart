
//============================= Updated BookMarksPage DeepSeek Ai ==========================
/*
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../widget/AppBarcustom.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: QuizAppBar(
        title: 'Bookmarks',
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep, color: colorScheme.onPrimary),
            onPressed: _confirmDeleteAll,
          ),
          IconButton(
            icon: Icon(Icons.share, color: colorScheme.onPrimary),
            onPressed: _shareBookmarks,
          ),
        ],
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            );
          }

          if (provider.bookmarks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 64,
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No bookmarks yet',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => provider.loadBookmarks(),
                    child: Text(
                      'Refresh',
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: colorScheme.primary,
            onRefresh: () async {
              await provider.loadBookmarks();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: provider.bookmarks.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final question = provider.bookmarks[index];
                return BookmarkCard(
                  question: question,
                  onDelete: () => _deleteBookmark(question),
                  onShare: () => _shareQuestion(question),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmDeleteAll() async {
    final provider = Provider.of<BookmarkProvider>(context, listen: false);
    if (provider.bookmarks.isEmpty) return;

    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Bookmarks'),
        content: const Text('Are you sure you want to delete all bookmarks? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete All'),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      await _deleteAllBookmarks();
    }
  }

  Future<void> _deleteAllBookmarks() async {
    try {
      await Provider.of<BookmarkProvider>(context, listen: false).clearAllBookmarks();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('All bookmarks deleted'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete bookmarks')),
        );
      }
    }
  }

  Future<void> _deleteBookmark(Question question) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bookmark'),
        content: const Text('Are you sure you want to delete this bookmark?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      try {
        await Provider.of<BookmarkProvider>(context, listen: false)
            .removeBookmark(question.question);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bookmark deleted')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete bookmark')),
          );
        }
      }
    }
  }

  Future<void> _shareQuestion(Question question) async {
    try {
      final unescape = HtmlUnescape();
      await Share.share(
        'Bookmarked Question:\n\n'
            '${unescape.convert(question.question)}\n\n'
            'Category: ${question.category}\n'
            'Difficulty: ${question.difficulty}\n\n'
            'Options:\n'
            '- ${question.incorrectAnswers.map((e) => unescape.convert(e)).join('\n- ')}\n'
            '- ${unescape.convert(question.correctAnswer)}\n\n'
            'Correct Answer: ${unescape.convert(question.correctAnswer)}',
        subject: 'Bookmarked Quiz Question',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to share question')),
        );
      }
    }
  }

  Future<void> _shareBookmarks() async {
    final provider = Provider.of<BookmarkProvider>(context, listen: false);
    if (provider.bookmarks.isEmpty) return;

    try {
      final unescape = HtmlUnescape();
      final questionsText = provider.bookmarks.map((q) =>
      '${unescape.convert(q.question)}\n'
          '(Category: ${q.category}, Difficulty: ${q.difficulty})\n'
          'Correct Answer: ${unescape.convert(q.correctAnswer)}\n'
      ).join('\n\n');

      await Share.share(
        'My Bookmarked Questions:\n\n$questionsText\n\n'
            'Total: ${provider.bookmarks.length} bookmarks',
        subject: 'My Quiz Bookmarks',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to share bookmarks')),
        );
      }
    }
  }
}

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

    return Card(
      elevation: 0,
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
      backgroundColor: colorScheme.surfaceVariant,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}*/


//================================== Updated BookMarksPage Quen Ai  ==================================
/*
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../widget/AppBarcustom.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: QuizAppBar(
        title: 'Bookmarks',
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: _deleteAllBookmarks,
            tooltip: 'Delete All',
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareBookmarks,
            tooltip: 'Share All',
          ),
        ],
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(colorScheme.primary)),
            );
          }

          if (provider.bookmarks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: colorScheme.onSurface.withOpacity(0.4)),
                  const SizedBox(height: 16),
                  Text(
                    'No bookmarks yet',
                    style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => provider.loadBookmarks(),
                    child: Text('Refresh', style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary)),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await provider.loadBookmarks();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.bookmarks.length,
              itemBuilder: (context, index) {
                final question = provider.bookmarks[index];
                return BookmarkCard(
                  question: question,
                  onDelete: () => _deleteBookmark(question),
                  onShare: () => _shareQuestion(question),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteAllBookmarks() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Bookmarks'),
        content: const Text('Are you sure you want to delete all bookmarks?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      try {
        await Provider.of<BookmarkProvider>(context, listen: false).deleteAllBookmarks();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All bookmarks deleted')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete bookmarks')),
        );
      }
    }
  }

  Future<void> _deleteBookmark(Question question) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bookmark'),
        content: const Text('Are you sure you want to delete this bookmark?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      try {
        await Provider.of<BookmarkProvider>(context, listen: false).removeBookmark(question.question);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bookmark deleted')),
        );
        Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete bookmark')),
        );
      }
    }
  }

  Future<void> _shareQuestion(Question question) async {
    try {
      final unescape = HtmlUnescape();
      await Share.share(
        'Bookmarked Question:\n\n'
            '${unescape.convert(question.question)}\n\n'
            'Category: ${question.category}\n'
            'Difficulty: ${question.difficulty}\n\n'
            'Options:\n'
            '- ${question.incorrectAnswers.map((e) => unescape.convert(e)).join('\n- ')}\n'
            '- ${unescape.convert(question.correctAnswer)}\n\n'
            'Correct Answer: ${unescape.convert(question.correctAnswer)}',
        subject: 'Bookmarked Quiz Question',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share question')),
      );
    }
  }

  Future<void> _shareBookmarks() async {
    final provider = Provider.of<BookmarkProvider>(context, listen: false);
    if (provider.bookmarks.isEmpty) return;

    try {
      final unescape = HtmlUnescape();
      final questionsText = provider.bookmarks.map((q) =>
      '${unescape.convert(q.question)}\n'
          '(Category: ${q.category}, Difficulty: ${q.difficulty})\n'
          'Correct Answer: ${unescape.convert(q.correctAnswer)}\n'
      ).join('\n\n');

      await Share.share(
        'My Bookmarked Questions:\n\n$questionsText\n\n'
            'Total: ${provider.bookmarks.length} bookmarks',
        subject: 'My Quiz Bookmarks',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share bookmarks')),
      );
    }
  }
}

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
    final unescape = HtmlUnescape();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.category, size: 16, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  question.category,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.primary.withOpacity(0.4), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Text(
                unescape.convert(question.question),
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Options:",
              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...question.incorrectAnswers.map(
                      (e) => Chip(
                    label: Text(unescape.convert(e)),
                    backgroundColor: colorScheme.error.withOpacity(0.2),
                    labelStyle: textTheme.bodySmall?.copyWith(color: colorScheme.onError),
                  ),
                ),
                Chip(
                  label: Text(unescape.convert(question.correctAnswer)),
                  backgroundColor: colorScheme.primary.withOpacity(0.2),
                  labelStyle: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.share, color: colorScheme.primary),
                  onPressed: onShare,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: colorScheme.error),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//================================== Updated BookMarksPage ChatGpt Ai  ==================================

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../widget/AppBarcustom.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppBar(
        title: 'Bookmarks',
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
            onPressed: _deleteAllBookmarks,
          ),
          IconButton(
            icon: Icon(Icons.share, color: Theme.of(context).colorScheme.primary),
            onPressed: _shareBookmarks,
          ),
        ],
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.bookmarks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No bookmarks yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => provider.loadBookmarks(),
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await provider.loadBookmarks();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.bookmarks.length,
              itemBuilder: (context, index) {
                final question = provider.bookmarks[index];
                return BookmarkCard(
                  question: question,
                  onDelete: () => _deleteBookmark(question),
                  onShare: () => _shareQuestion(question),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteBookmark(Question question) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bookmark'),
        content: const Text('Are you sure you want to delete this bookmark?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      try {
        await Provider.of<BookmarkProvider>(context, listen: false)
            .removeBookmark(question.question);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bookmark deleted')),
        );
        Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete bookmark')),
        );
      }
    }
  }

  Future<void> _deleteAllBookmarks() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Bookmarks'),
        content: const Text(
            'Are you sure you want to delete all bookmarks? This cannot be undone.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldDelete ?? false) {
      try {
        final provider = Provider.of<BookmarkProvider>(context, listen: false);
        final allBookmarks = List<Question>.from(provider.bookmarks);
        for (var q in allBookmarks) {
          await provider.removeBookmark(q.question);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All bookmarks deleted')),
        );
        Provider.of<BookmarkProvider>(context, listen: false).loadBookmarks();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete all bookmarks')),
        );
      }
    }
  }

  Future<void> _shareQuestion(Question question) async {
    try {
      final unescape = HtmlUnescape();
      await Share.share(
        'Bookmarked Question:\n\n'
            '${unescape.convert(question.question)}\n\n'
            'Category: ${question.category}\n'
            'Difficulty: ${question.difficulty}\n\n'
            'Options:\n'
            '- ${question.incorrectAnswers.map((e) => unescape.convert(e)).join('\n- ')}\n'
            '- ${unescape.convert(question.correctAnswer)}\n\n'
            'Correct Answer: ${unescape.convert(question.correctAnswer)}',
        subject: 'Bookmarked Quiz Question',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share question')),
      );
    }
  }

  Future<void> _shareBookmarks() async {
    final provider = Provider.of<BookmarkProvider>(context, listen: false);
    if (provider.bookmarks.isEmpty) return;

    try {
      final unescape = HtmlUnescape();
      final questionsText = provider.bookmarks.map((q) =>
      '${unescape.convert(q.question)}\n'
          '(Category: ${q.category}, Difficulty: ${q.difficulty})\n'
          'Correct Answer: ${unescape.convert(q.correctAnswer)}\n'
      ).join('\n\n');

      await Share.share(
        'My Bookmarked Questions:\n\n$questionsText\n\n'
            'Total: ${provider.bookmarks.length} bookmarks',
        subject: 'My Quiz Bookmarks',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share bookmarks')),
      );
    }
  }
}

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
    final unescape = HtmlUnescape();
    final answers = [...question.incorrectAnswers, question.correctAnswer];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category label (themed caption style)
            Text(
              question.category,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            // Question text inside a bordered container
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                unescape.convert(question.question),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Options heading
            const Text(
              "Options:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // List of answer options with bullet letters
            ...answers.asMap().entries.map((entry) {
              final index = entry.key;
              final answer = unescape.convert(entry.value);
              final isCorrect = index == answers.length - 1; // last is correct
              final answerTextStyle = TextStyle(
                fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
                color: isCorrect ? Colors.green : null,
              );
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}. ',
                      style: answerTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        answer,
                        style: answerTextStyle,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 12),
            // Action buttons (share & delete)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.share, color: Theme.of(context).colorScheme.primary),
                  onPressed: onShare,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



