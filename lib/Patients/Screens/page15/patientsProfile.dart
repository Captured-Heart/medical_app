import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page11-14/docProfileRegistered.dart';
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
import 'package:medical_app/firebase_Utils/authMethods.dart';
import 'package:medical_app/themes/theme.dart';
import 'package:medical_app/themes/theme_switch.dart';
import 'package:provider/provider.dart';

import 'chatPage.dart';

class PatientsProfile extends StatefulWidget {
  static const String routes = 'patientsProfilePage';

  @override
  _PatientsProfileState createState() => _PatientsProfileState();
}

bool recordsExpand = false;
bool correspondenceExpand = false;
bool paymentExpand = false;
bool switchTheme = true;

class _PatientsProfileState extends State<PatientsProfile> {
  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    var switchOn = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: BackIcon(),
      //   title: ChangeThemeButtonWidget(),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),

      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder(
                          future: getRecords(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              return Row(
                                  children: snapshot.data!.docs
                                      .map(
                                        (document) => ProfPicAndName(
                                          size: size,
                                          imageUrl: document['imageUrl'],
                                          // 'assets/images/oleg.jpg',
                                          name: document['name'],
                                        ),
                                      )
                                      .toList());
                            } else {
                              return Text('');
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DayNightSwitcherIcon(
                          isDarkModeEnabled: switchOn,
                          nightBackgroundColor: Theme.of(context).primaryColor,
                          dayBackgroundColor: Theme.of(context).primaryColor,
                          moonColor: Theme.of(context).buttonColor,
                          cratersColor: Theme.of(context).buttonColor,
                          sunColor: Theme.of(context).buttonColor,
                          cloudsColor: Colors.amber,
                          onStateChanged: (switchOn) {
                            final provider = Provider.of<ThemeProvider>(context,
                                listen: false);
                            provider.toggleTheme(switchOn);
                            // setState(() {
                            //   switchTheme = !switchTheme;
                            // });
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     final provider = Provider.of<ThemeProvider>(
                        //         context,
                        //         listen: false);
                        //     provider.toggleTheme(switchOn);
                        //     setState(() {
                        //       switchTheme = !switchTheme;
                        //     });
                        //   },
                        //   child: switchTheme
                        //       ? Icon(Icons.dangerous)
                        //       : Icon(Icons.access_alarm),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
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
              recordsExpand
                  ? Container(
                      // height: recordsExpand ? size.height * size.height : 0,
                      color: Theme.of(context).primaryColor,
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.012),
                      child: FutureBuilder(
                          future: getProfile(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView(
                                    children: snapshot.data!.docs
                                        .map(
                                          (document) => Padding(
                                            padding: EdgeInsets.only(
                                              top: 3.0,
                                            ),
                                            child: RecordsSubSection(
                                              size: size,
                                              title: 'May 23, 17:00',
                                              trailingWidget:
                                                  Text(document['name']),
                                              leadingWidget: VerticalDivider(
                                                thickness: 2,
                                                color: Color(0xff58A4EB),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    shrinkWrap: true,
                                  ),
                                  SizedBox(height: 8),
                                ],
                              );
                            } else {
                              return Center(
                                  child: Text(
                                      'Please Check your Network Connection'));
                            }
                          }),
                    )
                  : Container(),

              //?CORRESPONDENCE
              CorrespondenceProfileOptions(
                size: size,
                press: () {
                  setState(() {
                    correspondenceExpand = !correspondenceExpand;
                  });
                },
              ),
              correspondenceExpand
                  ? FutureBuilder(
                      future: getCorrespondence(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            color: Theme.of(context).primaryColor,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.012),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: ListView(
                                    children: snapshot.data!.docs
                                        .map(
                                          (document) => Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5.0,
                                            ),
                                            child: CorrespondenceSubSection(
                                              size: size,
                                              title: document['name'],
                                              trailingWidget: Text(
                                                'Look',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              leadingWidget: CachedNetworkImage(
                                                imageUrl: document['imageUrl'],
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                  color: Theme.of(context)
                                                      .buttonColor,
                                                )),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    shrinkWrap: true,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })
                  : Container(),

//?PAYMENT OPTIONS
              PaymentProfileOptions(
                size: size,
                press: () {
                  setState(() {
                    paymentExpand = !paymentExpand;
                  });
                },
              ),
              paymentExpand
                  ? FutureBuilder(
                      future: getPayments(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            color: Theme.of(context).primaryColor,
                            margin: EdgeInsets.symmetric(
                              vertical: size.height * 0.012,
                            ),
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
                                ListView(
                                  children: snapshot.data!.docs
                                      .map(
                                        (document) => Padding(
                                          padding: EdgeInsets.only(
                                            left: size.width * 0.047,
                                            right: size.width * 0.047,
                                            top: size.height * 0.01,
                                          ),
                                          child: PaymentNumberSessionRow(
                                              leading: document['number'],
                                              // '345365',
                                              name: document['name'],
                                              // 'Ivanov Ivan',
                                              date: document['date'],
                                              //  'May 21, 17:00',
                                              sum: '${document['price']}₽'
                                              // '2900₽',
                                              ),
                                        ),
                                      )
                                      .toList(),
                                  shrinkWrap: true,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })
                  : Container(),

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
              FutureBuilder(
                  future: getAppointment(),
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
                    return Container(
                      height: size.height * 0.23,
                      width: size.width * 0.99,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: snapshot.data!.docs
                            .map(
                              (document) => Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.02),
                                child: TodaySessionOption(
                                  size: size,
                                  image: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegDocProfile(
                                            docID:document['docId'],
                                            date: document['date'],
                                            time: document['time'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: CachedNetworkImage(
                                      width: size.width * 0.12,
                                      height: size.height * 0.1,
                                      imageUrl: document['imageUrl'],
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color: Theme.of(context).buttonColor,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  title: document['docName'],
                                  subtitle1: '${document['time']} | In',
                                  subtitle2: ' 00:05',
                                  subtitle2Color: Colors.green,
                                  beginButton: ApplyButton(
                                    size: size,
                                    text: 'To begin',
                                    horizontal: size.width * 0.0002,
                                    press: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => ChatPage()));
                                    },
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }),

              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              //   child: TodaySessionOption(
              //     size: size,
              //     image: Image.asset('assets/images/peter.png'),
              //     title: 'Vetrov Peter',
              //     subtitle1: '18:30 | In ',
              //     subtitle2: ' 01:45',
              //     subtitle2Color: Colors.blue,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  var db = FirebaseFirestore.instance;
  Future<QuerySnapshot> getAppointment() async {
    final uid = await authMethods.getCurrentUID();

    return await db
        .collection('patients')
        .doc(uid)
        .collection('Appointments')
        .get();
  }

  Future<QuerySnapshot> getRecords() async => await db
      .collection('patients')
      .doc('patientsID')
      .collection('Records')
      .get();

  Future<QuerySnapshot> getCorrespondence() async => await db
      .collection('patients')
      .doc('patientsID')
      .collection('favourites')
      .get();
  Future<QuerySnapshot> getPayments() async => await db
      .collection('patients')
      .doc('patientsID')
      .collection('Payments')
      .get();
  Future<QuerySnapshot> getProfile() async => await db
      .collection('patients')
      .doc('patientsID')
      .collection('Profile')
      .get();
}
