import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/quuestion.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  void choosedAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            chosenAnswers: selectedAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 15, 117),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/quiz-logo.png',
                width: 300,
                height: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Learn Flutter the fun way!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(150, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        onSelectAnswer: choosedAnswers,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_right_alt),
                label: Text(
                  'Start Quiz',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(150, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
