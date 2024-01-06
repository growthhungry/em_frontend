import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:flutter/material.dart';

class EducationVideoScreen extends StatefulWidget {
  const EducationVideoScreen({super.key});

  @override
  State<EducationVideoScreen> createState() => _EducationVideoScreenState();
}

class _EducationVideoScreenState extends State<EducationVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Синдром самозванца',
              style: headerTextStyle,
            ),
            Text(
                'Все о синдроме самозванца, как с ним справиться и жить уверенно',
                style: descriptionTextStyle),
            Text(
              'Спикер: Михаил Ледер',
              style: speakerTextStyle,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EducationVideoScreen())),
                  child: Text(
                    'Начать',
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
      )),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                color: const Color.fromRGBO(58, 58, 58, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
