import 'package:flutter/material.dart';

class ClassIsDoneScreen extends StatefulWidget {
  const ClassIsDoneScreen({super.key});

  @override
  State<ClassIsDoneScreen> createState() => _ClassIsDoneScreenState();
}

class _ClassIsDoneScreenState extends State<ClassIsDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/background_result.png'), // Замените 'assets/background_image.jpg' на путь к вашему изображению
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const Spacer(),
              const Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Урок успешно завершен!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          letterSpacing: -0.48,
                          fontFamily: 'GoogleSans'),
                    ),
                  )),
              const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(

                      'Теперь вы знаете больше о синдроме самозванца',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.48,
                          fontFamily: 'GoogleSans'),
                    ),
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 12),
                child: SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'На главную',
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
      ),
    );
  }
}
