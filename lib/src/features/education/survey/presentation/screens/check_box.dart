import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {

  Map<String, bool> symptoms = {
    'Самоуничтожение': false,
    'Тревога': false,
    'Одиночество': false,
    'Неуверенность': false,
    'Страх': false,
  };

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
                    'Какие признаки характеризуют синдром самозванца?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: -0.48,
                        fontFamily: 'GoogleSans'),
                  ),
                )),
            const SizedBox(height: 20),
            Column(
    children: symptoms.keys.map((String symptom) {
    return CheckboxListTile(
    title: Text(symptom),
    value: symptoms[symptom]!,
    onChanged: (bool? value) {
    setState(() {
    symptoms[symptom] = value!;
    });
    },
      controlAffinity: ListTileControlAffinity.leading,
    );
    }).toList(),
            ),
            /*Padding(
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
            ),*/
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
