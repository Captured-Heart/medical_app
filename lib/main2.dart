import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';
import 'package:medical_app/main.dart';

class Main2 extends StatefulWidget {
  @override
  _Main2State createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              unselectedLabelColor: Theme.of(context).highlightColor,
              labelColor: Theme.of(context).buttonColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 0.2,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.stethoscope),
                      SizedBox(width: 10),
                      Text('Therapists'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.userAlt),
                      SizedBox(width: 10),
                      Text('My profile')
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MainHomePage(size: size),
              // MyHomePage(),
              PatientsProfile(),
            ],
          )),
    );
  }
}
