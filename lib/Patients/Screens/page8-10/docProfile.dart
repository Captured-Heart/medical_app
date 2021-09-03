import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';
import 'package:medical_app/Patients/Screens/page5_7/appointMentPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/docProfileTabBarView.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/imageAndRatings.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/nearestAppointmentRow.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';
import 'package:medical_app/themes/theme_switch.dart';

class DocProfile extends StatefulWidget {
  static const String routes = 'docProfilePage';
  final String? reviewsId;
  const DocProfile({
    Key? key,
    this.reviewsId,
  }) : super(key: key);

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  AuthMethods authMethods = AuthMethods();
  var db = FirebaseFirestore.instance;
  dynamic data;
  dynamic docId;

  Future<DocumentSnapshot> getData(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(widget.reviewsId);
    return document.get();
    // await document.then(
    //   (QuerySnapshot snapshot) async {
    //     setState(() {
    //       docId = snapshot.docs.forEach((element) {
    //         print(element.id);
    //        });
    //       // data = snapshot.docs.first;
    //       // print(docId);
    //     });
    //   },
    // );
    // docId = document.document().documentID;
  }

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          leading: BackIconToHomePage(),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: FutureBuilder(
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
                    return Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageRatingsAndSignUpButton(
                              ratings: snapshot.data!['rating'],
                              size: size,
                              name: snapshot.data!['name'],
                              imageUrl: snapshot.data!['imageUrl'],
                              buttonText: 'Sign up for a consultation',
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppointMentPage(
                                      reviewsId: widget.reviewsId,
                                    ),
                                  ),
                                );
                              },
                            ),
                            NearestAppointmentRow(
                              size: size,
                              salary: snapshot.data!['salary'],
                              time: snapshot.data!['time'],
                            ),
                            Divider(thickness: 1),
                            TabBar(
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              unselectedLabelColor:
                                  Theme.of(context).highlightColor,
                              labelColor: Theme.of(context).buttonColor,
                              tabs: [
                                Tab(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidUser,
                                        size: 15,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'About',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.graduationCap,
                                        size: 15,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Education',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.thLarge,
                                        size: 15,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Specializations',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidThumbsUp,
                                        size: 15,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Reviews',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                child: DocProfileTabBarView(
                                  size: size,
                                  about: snapshot.data!['about'],
                                  reviewsId: widget.reviewsId,
                                  occupation: snapshot.data!['occupation'],
                                  years: snapshot.data!['years'],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
