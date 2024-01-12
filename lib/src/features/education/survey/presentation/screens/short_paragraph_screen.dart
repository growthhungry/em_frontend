import 'package:flutter/material.dart';

import '../../../../../common/components/styles/text_styles.dart';

class ShortParagraphScreen extends StatefulWidget {
  const ShortParagraphScreen({super.key});

  @override
  State<ShortParagraphScreen> createState() => _ShortParagraphScreenState();
}

class _ShortParagraphScreenState extends State<ShortParagraphScreen> {
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
                    'Опишите одним словом "синдром самозванца"?',
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
                // maxLines: 15,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  hintText: 'Напишите свой текст здесь',
                    hintStyle: hintTextStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(147, 147, 147, 1),
                            width: 2))),
              ),
            ),
            const Spacer(flex: 4),
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
