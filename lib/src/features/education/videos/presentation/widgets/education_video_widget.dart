import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/screens/education_video_screen.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/screens/video_list_screen.dart';
import 'package:flutter/material.dart';

class EducationVideoWidget extends StatelessWidget {
  const EducationVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 16),
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      height: 396,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
        // You can use Colors.white or any color you prefer
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 60.0,
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 172,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.white,
            ),
          ),
          Text(
            'Синдром самозванца',
            style: headerTextStyle,
          ),
          Text(
            'Все о синдроме самозванца, как с ним справиться и жить уверенно',
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: descriptionTextStyle,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Color.fromRGBO(147, 147, 147, 1),
                size: 20,
              ),
              Text(
                'Михаил Ледер',
                style: speakerTextStyle,
              )
            ],
          ),
          Text(
            'Доступно до 15.10.2023',
            style: TextStyle(
                color: Color.fromRGBO(96, 101, 214, 1),
                letterSpacing: -0.3,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: 0,
                color: Color.fromRGBO(67, 178, 98, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
