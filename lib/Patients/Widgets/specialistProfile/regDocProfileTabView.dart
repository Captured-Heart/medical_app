import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page5_7/worriesPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/addAnonymous.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';

class RegDocProfileTabBarView extends StatelessWidget {
  const RegDocProfileTabBarView({
    Key? key,
    required this.size, this.press,
  }) : super(key: key);

  final Size size;
final press;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //?About
        ListView(
          children: [
            ListTile(
              title: Text(
                '''Doctor of doctoral sciences. Great fellow, grandson granny, mommy's son. As my grandfather said - "I am your grandfather"''',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity:
                  VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                'Psychotherapist',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity:
                  VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                '10 years of experience',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity:
                  VisualDensity(horizontal: 0, vertical: -4),
            ),
          ],
        ),

        //?Education
        ListView(
          children: [
            ListTile(
              title: Text(
                'Teachers University College, Columbia',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity:
                  VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: AutoSizeText(
                'Languages: English, Russian, Spanish',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity:
                  VisualDensity(horizontal: 0, vertical: -4),
            ),
          ],
        ),

        //?Specialization
        ListView(
          children: [
            SleepProblemsRow(
              bGcolor: Theme.of(context).primaryColor,
              textColor: Theme.of(context).highlightColor,
            ),
            DepressionAcceptingRow(size: size),
          ],
        ),

        //?Reviews
        ListView(
          children: [
            AddAnnonymousReview(
              size: size,
              press:press,
            ),
            RegReviewsContainer(size: size),
            RegReviewsContainer(size: size),
            RegReviewsContainer(size: size),
          ],
        ),
      ],
    );
  }
}
