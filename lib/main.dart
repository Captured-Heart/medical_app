import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medical_app/Patients/Screens/page5_7/appointMentPage.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/allAndFavTabBarView.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/allAndFavourites.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/specialistHeader.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/accToRatingRow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_app/start.dart';
import 'package:medical_app/themes/theme.dart';
import 'package:provider/provider.dart';

import 'Patients/Screens/RegScreens/SignUp1.dart';
import 'Patients/Screens/RegScreens/signUp2.dart';
import 'Patients/Screens/page1-4/docFilters.dart';
import 'Patients/Screens/page15/patientsProfile.dart';
import 'Patients/Screens/page5_7/linkCard.dart';
import 'Patients/Screens/page8-10/docProfile.dart';
import 'Patients/Widgets/page1-4_Widgets/topHeader.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
      // DevicePreview(
      //   builder: (context) => MyApp(),
      //   enabled: !kReleaseMode,
      // ),
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          themeMode: themeProvider.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          home: StartPage(),
          routes: {
            MyHomePage.routes: (context) => MyHomePage(),
            DocFilters.routes: (context) => DocFilters(),
            AppointMentPage.routes: (context) => AppointMentPage(),
            LinkCardPage.routes: (context) => LinkCardPage(),
            DocProfile.routes: (context) => DocProfile(),
            PatientsProfile.routes: (context) => PatientsProfile(),
            SignUp1.routes: (context) => SignUp1(),
            SignUp2.routes: (context) => SignUp2(),
          },
        );
      });
}

class MyHomePage extends StatefulWidget {
  static const String routes = 'mainPage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DiscountContainer(),
                  SpecialistContainer(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          AccToRatingRow(size: size),
                          AllAndFavouritesRow(size: size),
                          AllAndFavTabBarView(size: size),
                        ],
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
