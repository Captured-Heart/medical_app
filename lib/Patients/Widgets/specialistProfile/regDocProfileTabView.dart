import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Screens/page5_7/worriesPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/addAnonymous.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';
import 'package:flash/flash.dart';

class RegDocProfileTabBarView extends StatefulWidget {
  const RegDocProfileTabBarView({
    Key? key,
    required this.size,
    // this.press,
    required this.about,
    required this.occupation,
    required this.years,
    this.docId,
  }) : super(key: key);

  final Size size;
  final String about, occupation, years;
  final String? docId;

  // final press;

  @override
  _RegDocProfileTabBarViewState createState() =>
      _RegDocProfileTabBarViewState();
}

class _RegDocProfileTabBarViewState extends State<RegDocProfileTabBarView> {
  @override
  void initState() {
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //?About
        ListView(
          children: [
            ListTile(
              title: Text(
                widget.about,
                // '''Doctor of doctoral sciences. Great fellow, grandson granny, mommy's son. As my grandfather said - "I am your grandfather"''',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                widget.occupation,
                // 'Psychotherapist',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                '${widget.years} years of experience',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
          ],
        ),

        //?Education
        FutureBuilder(
            future: getData(context),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.none)
                return Center(
                  child: Icon(
                    Icons.error,
                    size: 100,
                  ),
                );
              List<dynamic> eduTextReg = snapshot.data!['edu'];

              return ListView.builder(
                  itemCount: eduTextReg.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        eduTextReg[index],
                        // 'Teachers University College, hfhf',
                        style: TextStyle(fontSize: 15),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    );
                  });
            }),

        //?Specialization
        FutureBuilder(
            future: getData(context),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.none)
                return Center(
                  child: Icon(
                    Icons.error,
                    size: 100,
                  ),
                );
              List<dynamic> specText = snapshot.data!['spec'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  runSpacing: 8,
                  mainGroupAlignment: MainGroupAlignment.start,
                  groupRunAlignment: GroupRunAlignment.start,
                  crossGroupAlignment: CrossGroupAlignment.start,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: specText.cast(),
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  selectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  buttonHeight: 25,
                  unselectedColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  unselectedBorderColor:
                      Theme.of(context).canvasColor.withOpacity(0.2),
                  groupingType: GroupingType.wrap,
                ),
              );
            }),

        //?Reviews
        // AddAnnonymousReview(
        //   size: widget.size,
        //   press: widget.press,
        // ),
        Container(
          height: 40,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddAnnonymousReview(
                size: widget.size,
                // press:
                docId: widget.docId,
                // widget.press,
                ratings: '3',
              ),
              buildReviewsWidget(context, getDocreviews(context)),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<QuerySnapshot<Object?>> buildReviewsWidget(
      BuildContext context, future) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!.docs
                  .map(
                    (document) => RegReviewsContainer(
                      size: widget.size,
                      reviewText: document['reviews'],
                      ratings: document['ratings'],
                    ),
                  )
                  .toList(),
            );
          } else {
            return Text('');
          }
          // return
        });
  }

  Future<DocumentSnapshot> getData(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(widget.docId);
    return document.get();
  }

  Future<QuerySnapshot> getDocreviews(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(widget.docId)
        .collection('Reviews');

    return document.get();
  }
}
