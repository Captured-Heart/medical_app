import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/appointMentPage.dart';
import 'package:medical_app/Patients/Screens/docFilters.dart';
import 'package:medical_app/Patients/Widgets/HomePage/allAndFavTabBarView.dart';
import 'package:medical_app/Patients/Widgets/HomePage/allAndFavourites.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/specialistHeader.dart';
import 'package:medical_app/Patients/Widgets/HomePage/accToRatingRow.dart';
import 'package:medical_app/page1/topHeader.dart';
import 'package:medical_app/page7/linkCard.dart';
import 'package:medical_app/Patients/Screens/docProfile.dart';

import 'package:medical_app/themes/theme.dart';
import 'package:provider/provider.dart';

void main() {
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
          home: MyHomePage(),
          routes: {
            MyHomePage.routes: (context) => MyHomePage(),
            DocFilters.routes: (context) => DocFilters(),
            AppointMentPage.routes: (context) => AppointMentPage(),
            LinkCardPage.routes: (context) => LinkCardPage(),
            DocProfile.routes: (context) => DocProfile(),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AccToRatingRow(size: size),
                        AllAndFavouritesRow(size: size),
                        AllAndFavTabBarView(size: size),
                      ],
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
