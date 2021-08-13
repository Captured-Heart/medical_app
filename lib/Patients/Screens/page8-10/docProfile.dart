import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';
import 'package:medical_app/Patients/Screens/page5_7/appointMentPage.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/docProfileTabBarView.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/imageAndRatings.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/nearestAppointmentRow.dart';
import 'package:medical_app/themes/theme_switch.dart';


class DocProfile extends StatefulWidget {
  static const String routes = 'docProfilePage';

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
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
                    name: 'Ivanov Ivan',
                    imageUrl: 'assets/images/ivan.png',
                    buttonText: 'Sign up for a consultation',
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
