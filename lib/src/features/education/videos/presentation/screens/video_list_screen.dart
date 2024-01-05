import 'package:eneler_mariia/src/features/education/videos/presentation/widgets/education_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView.builder(itemBuilder: (context, index) {
        return EducationVideoWidget();
      })),
    );
  }
}
