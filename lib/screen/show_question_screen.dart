import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/model/question.dart';
import 'package:roqsal_quizapp_2026/provider/bookmark_provider.dart';
import 'package:roqsal_quizapp_2026/util/constant.dart';

class ShowQuestionScreen extends StatelessWidget {
  final List<Question> listQuestion;
  final Map<int, dynamic> answer;

  const ShowQuestionScreen({
    Key? key,
    required this.listQuestion,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: <Widget>[
              ListView.builder(
                itemCount: listQuestion.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final question = listQuestion[index];
                  final correct = question.correctAnswer == answer[index];
                  final bookmarkProvider = Provider.of<BookmarkProvider>(context);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                            color: Colors.grey.withOpacity(.5),
                          ),
                          BoxShadow(
                            offset: const Offset(-3, 0),
                            blurRadius: 15,
                            color: const Color(0xffb8bfce).withOpacity(.5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  HtmlUnescape().convert(question.question),
                                  style: kHeadingTextStyleAppBar.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  bookmarkProvider.isBookmarked(question.question)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: bookmarkProvider.isBookmarked(question.question)
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  try {
                                    await bookmarkProvider.toggleBookmark(question);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          bookmarkProvider.isBookmarked(question.question)
                                              ? 'Question bookmarked'
                                              : 'Bookmark removed',
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Failed to update bookmark'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...question.incorrectAnswers.map(
                                    (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(HtmlUnescape().convert(e)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  HtmlUnescape().convert(question.correctAnswer),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("Your answer: "),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  answer[index] == null ? "" : answer[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: correct ? Colors.green : Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(
                                  correct ? Icons.check_circle : Icons.close,
                                  color: correct ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}