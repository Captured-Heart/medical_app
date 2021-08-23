import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/chatPage.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/imageAndRatings.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/regDocProfileTabView.dart';
import 'package:medical_app/themes/theme_switch.dart';


class RegDocProfile extends StatefulWidget {
  static const String routes = 'RegdocProfilePage';

  @override
  _RegDocProfileState createState() => _RegDocProfileState();
}

class _RegDocProfileState extends State<RegDocProfile> {
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
          leading: BackIcon(),
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
                  RegImageRatingsAndSignUpButton(
                    ratings: '4',
                    size: size,
                    name: 'Ivanov Ivan',
                    imageUrl: 'assets/images/ivan.png',
                    buttonText: 'to write a message',
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, bottom: size.height * 0.03),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientsProfile()));
                        },
                        child: AutoSizeText(
                          'You are registered with this specialist on May 27, 17:00',
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
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
                      child: RegDocProfileTabBarView(
                        size: size,
                        press: () {
                          Navigator.pop(context);
                          _showDialogFlash(
                            vertical: size.height * 0.04,
                            horizontal: size.width * 0.09,
                          );
                        },
                      ),
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
