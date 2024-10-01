import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';

import 'data/quuestion.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  void answerQuestion(String seclectedAnswers) {
    widget.onSelectAnswer(seclectedAnswers);
    if (currentQuestionIndex  < questions.length-1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currrentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 15, 117),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      currrentQuestion.text,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...currrentQuestion.getShuffledAnswers().map(
                    (answer) {
                      return AnswerButton(
                        answerText: answer,
                        onTap: () {
                          answerQuestion(answer);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
