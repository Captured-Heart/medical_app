import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page11-14/docProfileRegistered.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/page15/profilePicAndName.dart';
import 'package:medical_app/Patients/Widgets/page15/todaySessionOption.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';
import 'package:medical_app/themes/theme.dart';
import 'package:provider/provider.dart';

import 'correspondence.dart';
import 'personalInfo.dart';
import 'post.dart';
import 'salaryPage.dart';

class SpecialistOffice extends StatefulWidget {
  @override
  _SpecialistOfficeState createState() => _SpecialistOfficeState();
}

class _SpecialistOfficeState extends State<SpecialistOffice> {
  dynamic docId;
  Future<dynamic> getDocData(BuildContext context) async {
    final uid = await authMethods.getCurrentUID();

    final CollectionReference document = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uid)
        .collection('Profile');

    // return docId = document.get();
    await document.get().then<dynamic>(
      (QuerySnapshot snapshot) async {
        setState(() {
          docId = snapshot.docs.first.id;
          // data = snapshot.docs.first;
          print(docId);
        });
      },
    );
    // docId = document.document().documentID;
  }

  @override
  void initState() {
    super.initState();
    getDocData(context);
  }

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
      // ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                        stream: getProfile(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasData) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: snapshot.data!.docs
                                    .map(
                                      (document) => ProfPicAndName(
                                        size: size,
                                        imageUrl: document['imageUrl'],
                                        // 'assets/images/oleg.jpg',
                                        name: document['name'],
                                        surName: document['surname'],
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
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Divider(
                  thickness: 1,
                  // height: 50,
                ),

                //?RECORDS
                SpecialistProfileOptions(
                  size: size,
                  text: Text('Records'),
                  icon: FontAwesomeIcons.list,
                  press: () {
                    // setState(() {
                    //   recordsExpand = !recordsExpand;
                    // });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostPage()));
                  },
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Badge(
                      badgeContent: Text('3'),
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        FontAwesomeIcons.list,
                        size: 18,
                        color: recordsExpand
                            ? Colors.blue
                            : Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                  trailingIcon: FontAwesomeIcons.angleRight,
                ),

                //?CORRESPONDENCE
                SpecialistProfileOptions(
                  size: size,
                  text: Text('Correspondence'),
                  icon: FontAwesomeIcons.solidCommentDots,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CorrespondencePage()),
                    );
                  },
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Badge(
                      badgeContent: Text('1'),
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        FontAwesomeIcons.solidCommentDots,
                        size: 18,
                        color: recordsExpand
                            ? Colors.blue
                            : Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                  trailingIcon: FontAwesomeIcons.angleRight,
                ),

                //?PERSONAL INFO
                SpecialistProfileOptions(
                  size: size,
                  text: Text('Personal Information'),
                  icon: FontAwesomeIcons.solidUser,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInformationPage(
                                  docId: docId,
                                )));
                  },
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidUser,
                      size: 18,
                      color: recordsExpand
                          ? Colors.blue
                          : Theme.of(context).highlightColor,
                    ),
                  ),
                  trailingIcon: FontAwesomeIcons.angleRight,
                ),

                //! FACTOR THIS AS A WIDGET IN ORDER TO CONTAIN BADGES
                SpecialistProfileOptions(
                  size: size,
                  text: Text('Salary'),
                  icon: FontAwesomeIcons.solidCreditCard,
                  press: () {
                    // setState(() {
                    //   recordsExpand = !recordsExpand;
                    // });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SalaryPage()));
                  },
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidCreditCard,
                      size: 18,
                      color: recordsExpand
                          ? Colors.blue
                          : Theme.of(context).highlightColor,
                    ),
                  ),
                  trailingIcon: FontAwesomeIcons.angleRight,
                ),

                //? TODAY SESSION
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  child: Center(
                    child: Text('Today\'s sessions',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        )),
                  ),
                ),
                FutureBuilder(
                    future: getCorrespondence(),
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
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  child: TodaySessionOption(
                                    size: size,
                                    image: GestureDetector(
                                      onTap: () {},
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
                                    title:
                                        document['name'] + document['surname'],
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
                              shrinkWrap: true,
                        ),
                      );
                    }),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                //   child: TodaySessionOption(
                //     size: size,
                //     title: 'Календарь',
                //     subtitle1: '17:00 | In',
                //     subtitle2: ' 00:05',
                //     subtitle2Color: Colors.green,
                //     image: Image.asset('assets/images/another.png'),
                //     beginButton: ApplyButton(
                //       size: size,
                //       text: 'To begin',
                //       horizontal: size.width * 0.0002,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final db = FirebaseFirestore.instance;

  final AuthMethods authMethods = AuthMethods();

  Stream<QuerySnapshot> getProfile() async* {
    final uid = await authMethods.getCurrentUID();
    yield* db.collection('doctors').doc(uid).collection('Profile').snapshots();
  }

  Future<QuerySnapshot> getCorrespondence() async {
    final uid = await authMethods.getCurrentUID();

    return await db.collection('doctors').doc(uid).collection('Payments').get();
  }
}

class SpecialistProfileOptions extends StatelessWidget {
  final Widget? text;

  final IconData? icon;

  final IconData? trailingIcon;

  final press;

  final Color? leadingIconColor, tileColor;

  final Widget? leadingWidget;
  final Size size;
  const SpecialistProfileOptions({
    Key? key,
    required this.text,
    this.icon,
    this.trailingIcon,
    this.press,
    this.leadingIconColor,
    this.tileColor,
    this.leadingWidget,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        tileColor: tileColor,
        leading: leadingWidget,
        trailing: Icon(
          trailingIcon,
          size: 22,
        ),
        title: text,
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        // dense: true,
      ),
    );
  }
}
