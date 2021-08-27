import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'package:medical_app/RegDoctor/loginDoc.dart';
import 'package:medical_app/RegPatient/loginPatients.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Spacer(),
              Text(
                'Who are you?',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              Spacer(),
              GroupButton(
                direction: Axis.vertical,
                selectedColor: Theme.of(context).buttonColor,
                selectedButton: 0,
                // selectedButtons: [0],
                buttonWidth: size.width * 0.9,
                buttonHeight: size.height * 0.08,
                spacing: 10,
                borderRadius: BorderRadius.circular(10),
                buttons: [
                  'I am a patient',
                  'I am a therapist',
                ],
                onSelected: (index, selected) {
                  setState(() {
                    if (index == 0) {
                      //?NAVIGATE TO LOGINPAGE PATIENTS!!!!!!!
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPagePatients()),
                      );
                    } else {
                      //?NAVIGATE TO LOGINPAGE DOCTORS!!!!!!!
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPageDocEmail()),
                      );
                    }
                  });
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
