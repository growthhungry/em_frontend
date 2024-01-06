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
