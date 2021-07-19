import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerClickedFn;
  final String answerText;

  Answer(this.answerText, this.answerClickedFn);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: Text(answerText),
        onPressed: () => answerClickedFn(),
      ),
    );
  }
}
