import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/doctorProfileCard.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';

class WorriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        // centerTitle: true,
        // title: Text('Choose what worries you'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Container(
          height: size.height,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Center(
                  child: AutoSizeText(
                'Choose What Worries You',
              )),
              // SizedBox(height: size.height * 0.025),
              Spacer(flex: 2),
              //WORK CHAPTER
              AboutMyself(
                text: 'Work',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width * 0.75,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ManButton(text: 'Panic attacks'),
                    ManButton(
                      text: 'Stress',
                      bGcolor: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                    ManButton(text: 'Sleep Problems'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 17),
                child: DepressionAcceptingRow(size: size),
              ),
              AboutMyself(
                text: 'Family',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width * 0.75,
                ),
              ),
              Spacer(flex: 1),

              //?Family Chapter
              Container(
                margin: EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ManButton(
                      text: 'Panic attacks',
                      bGcolor: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                    ManButton(text: 'Stress'),
                    ManButton(text: 'Sleep Problems')
                  ],
                ),
              ),

              //?DEPRESSION SUBSECTION
              Container(
                margin: EdgeInsets.only(bottom: 17),
                child: Row(
                  children: [
                    ManButton(
                      text: 'Depression',
                      bGcolor: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    ManButton(text: 'Accepting yourself'),
                  ],
                ),
              ),
              Spacer(flex: 1),

              //?2ND CHAPTER OF FAMILY
              AboutMyself(
                text: 'Family',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width * 0.75,
                ),
              ),
              SleepProblemsRow(
                bGcolor: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
              ),

              Container(
                child: Row(
                  children: [
                    DepressionAcceptingRow(size: size),
                    // ManButton(text: 'Accepting yourself'),
                  ],
                ),
              ),
              SleepProblemsRow(
                bGcolor: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
              ),
              DepressionAcceptingRow(size: size),
              Spacer(flex: 1),

              //?3rd CHAPTER OF FAMILY
              Container(
                margin: EdgeInsets.only(top: 12),
                child: AboutMyself(
                  text: 'Family',
                  divider: Container(
                    height: 0.2,
                    color: Theme.of(context).canvasColor,
                    width: size.width * 0.75,
                  ),
                ),
              ),
              SleepProblemsRow(
                bGcolor: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
              ),
              DepressionAcceptingRow(size: size),
              SleepProblemsRow(
                bGcolor: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
              ),
              DepressionAcceptingRow(size: size),
              Spacer(flex: 1),

              //?APPLY BUTTON
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ApplyButton(
                    size: size,
                    text: 'Apply',
                    horizontal: 0.25,
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class DepressionAcceptingRow extends StatelessWidget {
  const DepressionAcceptingRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ManButton(
          text: 'Depression',
        ),
        SizedBox(
          width: size.width * 0.04,
        ),
        ManButton(text: 'Accepting yourself'),
      ],
    );
  }
}

class SleepProblemsRow extends StatelessWidget {
  final Color bGcolor, textColor;

  const SleepProblemsRow({
    Key? key,
    required this.bGcolor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ManButton(
            text: 'Panic attacks',
          ),
          ManButton(text: 'Stress'),
          ManButton(
            text: 'Sleep Problems',
            bGcolor: bGcolor,
            textColor: textColor,
          )
        ],
      ),
    );
  }
}
