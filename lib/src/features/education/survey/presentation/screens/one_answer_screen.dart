import 'package:flutter/material.dart';

class OneAnswerScreen extends StatefulWidget {
  const OneAnswerScreen({super.key});

  @override
  State<OneAnswerScreen> createState() => _OneAnswerScreenState();
}

class _OneAnswerScreenState extends State<OneAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: 20,
              decoration: InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
