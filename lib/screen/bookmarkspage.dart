
//============================= Updated BookMarksPage DeepSeek Ai ==========================

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../widget/AppBarcustom.dart';
import '../widget/bookmarkcard.dart';

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
            //icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
            icon: Icon(Icons.delete_sweep, color: colorScheme.error),

            onPressed: _confirmDeleteAll,
          ),
          IconButton(
            icon: Icon(Icons.share, color: colorScheme.primary),
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




