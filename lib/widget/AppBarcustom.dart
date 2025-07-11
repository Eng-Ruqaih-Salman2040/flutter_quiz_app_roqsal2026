// Create a new file app_bar.dart
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;

  const QuizAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25,
        //kHeadingTextStyleAppBar.copyWith(
           // color: Colors.white
        ),
      ),
      centerTitle: true,
     // backgroundColor: backgroundColor ?? kItemSelectBottomNav,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}