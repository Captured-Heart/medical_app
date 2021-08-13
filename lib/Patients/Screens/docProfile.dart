import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Screens/worriesPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/docProfileTabBarView.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/imageAndRatings.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/nearestAppointmentRow.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';
import 'package:medical_app/page15/patientsProfile.dart';
import 'package:medical_app/page18/personalInfo.dart';
import 'package:medical_app/themes/theme_switch.dart';

class DocProfile extends StatefulWidget {
  static const String routes = 'docProfilePage';

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  bool bottomSheet = true;

  void _showDialogFlash({
    bool persistent = true,
    double vertical = 22,
    double horizontal = 20,
  }) {
    context.showFlashDialog(
      persistent: persistent,
      backgroundColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      content: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Center(
          child: Text(
            'Review will be published during the week!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
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
          title: ChangeThemeButtonWidget(),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageRatingsAndSignUpButton(
                    size: size,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientsProfile()));
                    },
                  ),
                  NearestAppointmentRow(size: size),
                  Divider(thickness: 1),
                  TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    unselectedLabelColor: Theme.of(context).highlightColor,
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
                              style: TextStyle(fontWeight: FontWeight.w600),
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
                              style: TextStyle(fontWeight: FontWeight.w600),
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
                              style: TextStyle(fontWeight: FontWeight.w600),
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
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: DocProfileTabBarView(size: size),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}









class RatingsRow extends StatelessWidget {
  const RatingsRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingStar(size: size),
        SizedBox(width: 10),
        AutoSizeText('3'),
        SizedBox(width: 3),
        Icon(FontAwesomeIcons.solidUser, size: 10, color: Color(0xff858585)),
      ],
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: size.width * 0.04,
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        empty: Icon(
          Icons.star,
          color: Colors.grey,
        ),
        half: Icon(
          Icons.star,
          color: Colors.amber,
        ),
        full: Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
      // itemBuilder: (context, _) => Icon(
      //   Icons.star,
      //   color: Colors.amber,
      // ),
      // //INCASE IN NEEDS TO BE STORED ON THE FIRESTORE, WE USE THE UPDATE HERE
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
