import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page18/profileSettings.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/page15/RecordsProfileOptions.dart';
import 'package:medical_app/Patients/Widgets/page15/correspondenceProfileOptions.dart';
import 'package:medical_app/Patients/Widgets/page15/correspondenceSubSection.dart';
import 'package:medical_app/Patients/Widgets/page15/numberSessionSumRow.dart';
import 'package:medical_app/Patients/Widgets/page15/paymentNumberSessionRow.dart';
import 'package:medical_app/Patients/Widgets/page15/paymentProfileOptions.dart';
import 'package:medical_app/Patients/Widgets/page15/profileOptions.dart';
import 'package:medical_app/Patients/Widgets/page15/profilePicAndName.dart';
import 'package:medical_app/Patients/Widgets/page15/recordssubSection.dart';
import 'package:medical_app/Patients/Widgets/page15/todaySessionOption.dart';
import 'package:medical_app/themes/theme_switch.dart';

import 'chatPage.dart';

class PatientsProfile extends StatefulWidget {
  static const String routes = 'patientsProfilePage';

  @override
  _PatientsProfileState createState() => _PatientsProfileState();
}

bool recordsExpand = false;
bool correspondenceExpand = false;
bool paymentExpand = false;

class _PatientsProfileState extends State<PatientsProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings()));
                  },
                  child: ProfPicAndName(
                    size: size,
                    imgString: 'assets/images/oleg.jpg',
                    name: 'Oleg',
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Divider(
                  thickness: 1,
                  // height: 50,
                ),

                //? RECORDS
                RecordsProfileOptions(
                  size: size,
                  title: 'Records',
                  icon: FontAwesomeIcons.list,
                  press: () {
                    setState(() {
                      recordsExpand = !recordsExpand;
                    });
                  },
                ),
                Container(
                  height: recordsExpand ? size.height * 0.076 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecordsSubSection(
                        size: size,
                        title: 'May 23, 17:00',
                        trailingWidget: Text('Specialist: Ivanov Ivan'),
                        leadingWidget: VerticalDivider(
                          thickness: 2,
                          color: Color(0xff58A4EB),
                        ),
                      ),
                      SizedBox(height: 8),
                      RecordsSubSection(
                        size: size,
                        title: 'May 24, 13:00',
                        trailingWidget: Text('Specialist: Ivanov Ivan'),
                        leadingWidget: VerticalDivider(
                          thickness: 2,
                          color: Color(0xff58A4EB),
                        ),
                      ),
                    ],
                  ),
                ),

                //?CORRESPONDENCE
                CorrespondenceProfileOptions(
                  size: size,
                  press: () {
                    setState(() {
                      correspondenceExpand = !correspondenceExpand;
                    });
                  },
                ),
                Container(
                  height: correspondenceExpand ? size.height * 0.12 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CorrespondenceSubSection(
                        size: size,
                        title: 'Ivanov Ivan',
                        trailingWidget: Text(
                          'Look',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        leadingWidget: Image.asset('assets/images/ivan.png'),
                      ),
                      SizedBox(height: 10),
                      CorrespondenceSubSection(
                        size: size,
                        title: 'Vetrov Peter',
                        trailingWidget: Text(
                          'Look',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        leadingWidget: Image.asset('assets/images/peter.png'),
                      ),
                    ],
                  ),
                ),

//?PAYMENT OPTIONS
                PaymentProfileOptions(
                  size: size,
                  press: () {
                    setState(() {
                      paymentExpand = !paymentExpand;
                    });
                  },
                ),
                Container(
                  height: paymentExpand ? size.height * 0.17 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.03,
                        ),
                        child: NumberSessionSumRow(),
                      ),

                      //?PAYMENT_OPTION_ROW
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.01,
                        ),
                        child: PaymentNumberSessionRow(
                          leading: '345365',
                          name: 'Ivanov Ivan',
                          date: 'May 21, 17:00',
                          sum: '2900₽',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.01,
                        ),
                        child: PaymentNumberSessionRow(
                          leading: '845365',
                          name: 'Ivanov Ivan',
                          date: 'May 19, 17:00',
                          sum: '2900₽',
                        ),
                      ),
                      // SizedBox(height: 10),
                    ],
                  ),
                ),

                Divider(
                  thickness: 1,
                  // height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings()));
                  },
                  child: ProfileOptions(
                    text: 'personal information',
                    icon: FontAwesomeIcons.solidUser,
                    size: size,
                    leadingWidget: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Theme.of(context).highlightColor,
                        size: size.height * 0.027,
                      ),
                    ),
                  ),
                ),
                ProfileOptions(
                  text: 'Rate app',
                  icon: FontAwesomeIcons.solidStar,
                  size: size,
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidStar,
                      color: Theme.of(context).highlightColor,
                      size: size.height * 0.027,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  // height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Center(
                    child: Text(
                      'Today\'s sessions',
                    ),
                  ),
                ),
                TodaySessionOption(
                  size: size,
                  title: 'Ivanov Ivan',
                  subtitle1: '17:00 | In',
                  subtitle2: ' 00:05',
                  subtitle2Color: Colors.green,
                  imageString: 'assets/images/ivan.png',
                  beginButton: ApplyButton(
                    size: size,
                    text: 'To begin',
                    horizontal: size.width * 0.0002,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: TodaySessionOption(
                    size: size,
                    title: 'Vetrov Peter',
                    subtitle1: '18:30 | In ',
                    subtitle2: ' 01:45',
                    subtitle2Color: Colors.blue,
                    imageString: 'assets/images/peter.png',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
