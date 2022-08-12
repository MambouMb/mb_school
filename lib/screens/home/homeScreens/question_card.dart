import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mb_school/models/Question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Should I ${question.query} ?"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(question.aswer!.capitalize!,
                        style: Theme.of(context).textTheme.headline6),
                    const Spacer(),
                    Text("${question.createdAt}"),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
