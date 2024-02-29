import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/presentation/screens/test_screen.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/training_video_entity.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationVideoScreen extends StatefulWidget {
  const EducationVideoScreen({super.key, required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
  @override
  State<EducationVideoScreen> createState() => _EducationVideoScreenState();
}

class _EducationVideoScreenState extends State<EducationVideoScreen> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            widget.trainingVideoEntity.linkToYoutubeVideo)!);
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.trainingVideoEntity;
    return Scaffold(
      appBar: const _CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: 182,
                child: YoutubePlayer(controller: _youtubePlayerController),
              ),
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
            const Spacer(),
            FurtherButtonWidget(
              onPressed: () {
                _youtubePlayerController.pause();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestScreen(
                            trainingVideoEntity: widget.trainingVideoEntity)));
              },
              isActive: false,
            )
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
