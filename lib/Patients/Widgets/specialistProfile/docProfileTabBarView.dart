import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';

class DocProfileTabBarView extends StatefulWidget {
  final String about, occupation, years;

  final String? reviewsId;

  DocProfileTabBarView({
    Key? key,
    required this.size,
    required this.about,
    this.reviewsId,
    required this.occupation,
    required this.years,
  }) : super(key: key);

  final Size size;

  @override
  _DocProfileTabBarViewState createState() => _DocProfileTabBarViewState();
}

class _DocProfileTabBarViewState extends State<DocProfileTabBarView> {
  @override
  void initState() {
    super.initState();
    getData(context);
    print(widget.reviewsId);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //
        //?ABOUT
        ListView(
          children: [
            ListTile(
              title: Text(
                widget.about,
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                widget.occupation,
                // '''Doctor of doctoral sciences. Great fellow, grandson granny, mommy's son. As my grandfather said - "I am your grandfather"''',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              title: Text(
                '${widget.years} years of experience',
                // '''Doctor of doctoral sciences. Great fellow, grandson granny, mommy's son. As my grandfather said - "I am your grandfather"''',
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
          ],
        ),

        //?EDUCATION
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
              List<dynamic> eduText = snapshot.data!['edu'];

              return ListView.builder(
                  itemCount: eduText.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        eduText[index],
                        // 'Teachers University College, hfhf',
                        style: TextStyle(fontSize: 15),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    );
                  });
            }),

//? SPECIALIZATION
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

        //?REVIEWS
        FutureBuilder(
            future: getDocReviews(context),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.none)
                return Center(
                  child: Icon(
                    Icons.error,
                    size: 100,
                  ),
                );
              return ListView(
                  children: snapshot.data!.docs
                      .map(
                        (document) => ReviewsContainer(
                          size: widget.size,
                          ratings: document['ratings'],
                          reviewText: document['reviews'],
                        ),
                        // ReviewsContainer(size: widget.size),
                        // ReviewsContainer(size: widget.size),
                      )
                      .toList());
            }),
      ],
    );
  }

  final db = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getData(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(widget.reviewsId);
    return document.get();
  }

  Future<QuerySnapshot> getDocReviews(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(widget.reviewsId)
        .collection('Reviews');
    return document.get();
  }
}
