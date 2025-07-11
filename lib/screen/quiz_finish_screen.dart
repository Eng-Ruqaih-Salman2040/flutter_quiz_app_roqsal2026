//================================== Before Update UI by DeepSeek ai =================================
/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/score_provider.dart';
//import 'package:roqsal_quizapp_2026/screen/dashboard.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard_screen.dart';


import 'package:roqsal_quizapp_2026/screen/homes_screen.dart';
import 'package:roqsal_quizapp_2026/screen/show_question_screen.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';
import 'package:roqsal_quizapp_2026/widget/button.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/question_provider.dart';

class QuizFinishPage extends StatefulWidget {
  final String title;
  final Map<int,dynamic>? answer;
  final List<Question>? listQuestion;

  //final int id;  // Add this line

  const QuizFinishPage({
    Key? key,
    required this.title,
    required this.answer,
    required this.listQuestion,
   // required this.id,  // Add this parameter
  }) : super(key: key);


  //const QuizFinishPage({Key? key, required this.title, this.answer, this.listQuestion}) : super(key: key);

  @override
  _QuizFinishPageState createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {
  int correct = 0 ;
  int incorrect = 0;
  int score = 0 ;
  final nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    widget.answer!.forEach((key, value) {
      if (widget.listQuestion![key].correctAnswer == value) {
        correct ++;
        score +=10;
      }else{
        incorrect ++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ballon2.png'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon4.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon2.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: -20,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon4.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: Image.asset('assets/congratulate.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Your Score : ",
                        style: kHeadingTextStyleAppBar.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "$score",
                        style: kHeadingTextStyleAppBar.copyWith(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You have successfully completed",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.title,style: kHeadingTextStyleAppBar.copyWith(
                    fontSize: 25
                  ),),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Chip(

                        elevation: 5.0,
                        shadowColor: Colors.black54,
                      backgroundColor: Colors.grey[200],
                      label: Row(
                        children: <Widget>[
                          Icon(Icons.check,color: Colors.green,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("$correct  correct"),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Chip(
                        elevation: 5.0,
                        shadowColor: Colors.black54,
                        backgroundColor: Colors.grey[200],
                        label: Row(
                          children: <Widget>[
                            Icon(Icons.close,color: Colors.red,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("$incorrect incorrect"),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ],
                ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 280,
                    child: Button(
                        title: 'Show Question',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ShowQuestionScreen(
                            answer: widget.answer!,
                            listQuestion: widget.listQuestion!,)));
                        },
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 280,
                    child: Button(
                        title: 'Save Score',
                        onTap: (){
                          _buildDialogSaveScore();
                        })
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 280,
                      child: Button(
                          title: 'Home',
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>DashboardScreen()), (e) => false);
                          })
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


  Future<void> _buildDialogSaveScore() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('userName') ?? 'User';
    final imagePath = prefs.getString('imagePath');
    final nameController = TextEditingController(text: userName);

    // Get the QuestionProvider with null check
    final questionProvider = Provider.of<QuestionProvider>(context, listen: false);
    final answerMap = questionProvider.answer;
    final questionsList = widget.listQuestion;

    // Add null checks for listQuestion and answer
    if (questionsList!.isEmpty || answerMap.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No questions or answers available')),
      );
      return;
    }

    // Calculate correct answers with null safety
    final correctAnswers = answerMap.entries
        .where((entry) =>
    entry.key < questionsList.length &&
        questionsList[entry.key].correctAnswer == entry.value)
        .length;

    final score = (correctAnswers / questionsList.length * 100).round();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetAnimationDuration: const Duration(milliseconds: 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // User Profile Section with null check
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: imagePath != null
                        ? FileImage(File(imagePath))
                        : null,
                    child: imagePath == null
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Score Saving Form
                  Text(
                    'Save Your Score',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kItemSelectBottomNav,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Quiz Name",
                      prefixIcon: Icon(Icons.quiz),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        "Your Score: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$score% ($correctAnswers/${questionsList.length})",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: kItemSelectBottomNav,
                        ),
                        // onPressed: () async {
                        //   final now = DateTime.now();
                        //   final date = DateFormat('yyyy-MM-dd HH:mm').format(now);
                        //
                        //   // Get the ScoreProvider with null check
                        //   final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
                        //
                        //   try {
                        //     await scoreProvider.addScore(
                        //       nameController.text,
                        //       questionsList[widget.id].category,
                        //       score,
                        //       date,
                        //       correctAnswers,
                        //       questionsList.length,
                        //     );
                        //
                        //     if (!mounted) return;
                        //     Navigator.pop(context);
                        //     Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (_) => const DashboardScreen(),
                        //       ),
                        //           (route) => false,
                        //     );
                        //   } catch (e) {
                        //     if (!mounted) return;
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(content: Text('Error saving score: $e')),
                        //     );
                        //   }
                        // },
                        onPressed: () async {
                          final now = DateTime.now();
                          final date = DateFormat('yyyy-MM-dd HH:mm').format(now);

                          final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);

                          await scoreProvider.addScore(
                            nameController.text,
                            widget.listQuestion!.isNotEmpty
                                ? widget.listQuestion![0].category  // Use first question's category or another safe access
                                : 'General Quiz',
                            score,
                            date,
                            correctAnswers,
                            widget.listQuestion!.length,
                          );

                          if (!mounted) return;
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DashboardScreen(),
                            ),
                                (route) => false,
                          );
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
   _saveScore() async {
      var now =  DateTime.now();
     String datetime =  DateFormat.yMd().format(now);
     await Provider.of<ScoreProvider>(context,listen: false).addScore(nameController.text,
       widget.title, score,datetime ,correct,widget.listQuestion!.length);
     Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>DashboardScreen()), (e) => false);
   }
}
*/


//===================================== After Update UI by DeepSeek ai =================================

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/score_provider.dart';
import 'package:roqsal_quizapp_2026/screen/dashboard_screen.dart';
import 'package:roqsal_quizapp_2026/screen/show_question_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class QuizFinishPage extends StatefulWidget {
  final String title;
  final Map<int, dynamic> answer;
  final List<Question> listQuestion;

  const QuizFinishPage({
    Key? key,
    required this.title,
    required this.answer,
    required this.listQuestion,
  }) : super(key: key);

  @override
  _QuizFinishPageState createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {
  int correct = 0;
  int incorrect = 0;
  int score = 0;
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    calculateScore();
  }

  void calculateScore() {
    widget.answer.forEach((key, value) {
      if (widget.listQuestion[key].correctAnswer == value) {
        correct++;
        score += 10;
      } else {
        incorrect++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/congratulate.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  "Quiz Completed!",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your Score: $score",
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                Text(
                  "You have completed the ${widget.title} quiz",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildScoreChip(
                      label: "$correct Correct",
                      icon: Icons.check,
                      color: Colors.green,
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(width: 20),
                    _buildScoreChip(
                      label: "$incorrect Incorrect",
                      icon: Icons.close,
                      color: Colors.red,
                      colorScheme: colorScheme,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _buildActionButton(
                  text: 'Show Questions',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ShowQuestionScreen(
                        answer: widget.answer,
                        listQuestion: widget.listQuestion,
                      ),
                    ),
                  ),
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 15),
                _buildActionButton(
                  text: 'Save Score',
                  onPressed: _buildDialogSaveScore,
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 15),
                _buildActionButton(
                  text: 'Back to Home',
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                        (route) => false,
                  ),
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreChip({
    required String label,
    required IconData icon,
    required Color color,
    required ColorScheme colorScheme,
  }) {
    return Chip(
      backgroundColor: colorScheme.surfaceContainerHighest,
      label: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
    required ColorScheme colorScheme,
  }) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Future<void> _buildDialogSaveScore() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('userName') ?? 'User';
    final imagePath = prefs.getString('imagePath');
    nameController.text = userName;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Save Your Score'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: imagePath != null
                      ? FileImage(File(imagePath))
                      : null,
                  child: imagePath == null
                      ? Icon(Icons.person, size: 40, color: Theme.of(context).colorScheme.onSurface)
                      : null,
                ),
                const SizedBox(height: 10),
                Text(userName),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Quiz Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text("Score: "),
                    Text("$score ($correct/${widget.listQuestion.length})"),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a quiz name')),
                  );
                  return;
                }

                final now = DateTime.now();
                final date = DateFormat('yyyy-MM-dd HH:mm').format(now);

                final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
                await scoreProvider.addScore(
                  nameController.text,
                  widget.title,
                  score,
                  date,
                  correct,
                  widget.listQuestion.length,
                );

                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                      (route) => false,
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}