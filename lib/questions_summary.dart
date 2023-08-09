import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    final Color wrongColor = Color.fromARGB(236, 228, 3, 249);
    final Color rightColor = Color.fromARGB(255, 95, 138, 231);

    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              String userAnswer = data['user_answer'] as String;
              String correctAnswer = data['correct_answer'] as String;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIdentifier(
                        index: ((data['question_index'] as int) + 1).toString(),
                        userAnswer: userAnswer,
                        correctAnswer: correctAnswer,
                        rightColor: rightColor,
                        wrongColor: wrongColor),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            color: Color.fromARGB(207, 255, 255, 255),
                            text: data['question'] as String,
                            fontSize: 18,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            color: wrongColor,
                            text: data['user_answer'] as String,
                            fontSize: 16,
                          ),
                          CustomText(
                            color: rightColor,
                            text: data['correct_answer'] as String,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.userAnswer,
    required this.correctAnswer,
    required this.rightColor,
    required this.wrongColor,
    required this.index,
  });

  final String userAnswer;
  final String correctAnswer;
  final Color rightColor;
  final Color wrongColor;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: userAnswer == correctAnswer ? rightColor : wrongColor,
      ),
      child: CustomText(
        color: Colors.black,
        text: index,
        fontSize: 14,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.color,
      required this.text,
      required this.fontSize});

  final Color color;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
