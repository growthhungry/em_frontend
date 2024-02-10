import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/screens/test_screen.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/switch_answer_widget.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';
import 'package:flutter/material.dart';

class EducationVideoScreen extends StatefulWidget {
  const EducationVideoScreen({super.key, required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
  @override
  State<EducationVideoScreen> createState() => _EducationVideoScreenState();
}

class _EducationVideoScreenState extends State<EducationVideoScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.trainingVideoEntity;
    return Scaffold(
      appBar: _CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 182,
            ),
            Text(
              data.name,
              style: headerTextStyle,
            ),
            Text(data.descrpiption, style: descriptionTextStyle),
            Text(
              data.speaker,
              style: speakerTextStyle,
            ),
            Spacer(),
            FurtherButtonWidget(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestScreen(
                            trainingVideoEntity: widget.trainingVideoEntity))))
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
