import 'package:flutter/material.dart';

class NoClassesScreen extends StatefulWidget {
  const NoClassesScreen({super.key});

  @override
  State<NoClassesScreen> createState() => _NoClassesScreenScreenState();
}

class _NoClassesScreenScreenState extends State<NoClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Image.asset('assets/icons/success.png',height: 150,width: 150),
            const SizedBox(height: 12),
            const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Вы завершили все уроки!',
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
                    'Просим вас ожидать ответа от команды Growthhungry',
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
    );
  }
}
