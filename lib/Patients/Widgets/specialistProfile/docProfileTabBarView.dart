import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page5_7/worriesPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';

class DocProfileTabBarView extends StatelessWidget {
  final String about;

  final String? reviewsId;

  DocProfileTabBarView({
    Key? key,
    required this.size,
    required this.about,  this.reviewsId,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //?About
        FutureBuilder(
          //! YOU MIGHT MANUALLY ADD THE STREAM HERE AFTER SOURCING FOR THE DOCiD
            future: getAbout(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {}
              return ListView(children: [
                ListTile(
                  title: Text(
                    about,
                    // '''Doctor of doctoral sciences. Great fellow, grandson granny, mommy's son. As my grandfather said - "I am your grandfather"''',
                    style: TextStyle(fontSize: 15),
                  ),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                ),
              ]);
            }),

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
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: AutoSizeText(
                'Languages: English, Russian, Spanish',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
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
            ReviewsContainer(size: size),
            ReviewsContainer(size: size),
            ReviewsContainer(size: size),
          ],
        ),
      ],
    );
  }

  final db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getAbout() async => await db
      .collection('doctors')
      .doc('doctorsID')
      .collection('Profiles')
      .get();
       Future<QuerySnapshot> getReviews() async => await db
      .collection('doctors')
      .doc('doctorsID')
      .collection('Profiles').doc(reviewsId).collection('Reviews')
      .get();
}
