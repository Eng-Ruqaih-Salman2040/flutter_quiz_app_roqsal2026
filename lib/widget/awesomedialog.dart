import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';

 buildDialog(BuildContext context,String title,String message, DialogType dialogType,GestureTapCallback onTapOk,GestureTapCallback onTapCancel){
   return AwesomeDialog(
       context: context,
       dialogType: dialogType,
       animType: AnimType.bottomSlide,
       title: title,
       btnOkColor: kItemSelectBottomNav,
       desc:  message,
       btnCancelOnPress: onTapCancel,
       btnOkOnPress: onTapOk).show();
 }
// void buildDialog(int score, int correctAnswers, QuestionProvider provider) {
//   AwesomeDialog(
//     context: context,
//     dialogType: DialogType.success,
//     animType: AnimType.bottomSlide,
//     title: 'Quiz Completed!',
//     desc: 'You scored $score% (${correctAnswers}/${widget.listQuestion.length} correct answers)',
//     btnOkText: 'View Results',
//     btnOkColor: kItemSelectBottomNav,
//     btnOkOnPress: () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => QuizFinishPage(
//             title: widget.listQuestion[widget.id].category,
//             answer: provider.answer,
//             listQuestion: widget.listQuestion,
//           ),
//         ),
//       );
//     },
//     btnCancelText: 'Cancel',
//     btnCancelOnPress: () {},
//   ).show();
// }