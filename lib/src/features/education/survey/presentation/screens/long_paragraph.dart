import 'package:flutter/material.dart';

class LongParagraphScreen extends StatefulWidget {
  const LongParagraphScreen({super.key});

  @override
  State<LongParagraphScreen> createState() => _LongParagraphScreenState();
}

class _LongParagraphScreenState extends State<LongParagraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Что вы поняли под термином "синдром самозванца"?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: -0.48,
                        fontFamily: 'GoogleSans'),
                  ),
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 15,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(147, 147, 147, 1),
                            width: 2)),
                    hintText: 'Напишите свой текст здесь'
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Дальше',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(96, 101, 214, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
