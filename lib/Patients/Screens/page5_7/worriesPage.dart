import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
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
        leading: BackIcon(),
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: AutoSizeText(
                  'Choose What Worries You',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: size.height * 0.035),

              //WORK CHAPTER
              AboutMyself(
                text: 'Work',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width / 1.45,
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 11),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       ManButton(text: 'Panic attacks'),
              //       ManButton(
              //         text: 'Stress',
              //         bGcolor: Theme.of(context).buttonColor,
              //         textColor: Theme.of(context).primaryColor,
              //       ),
              //       ManButton(text: 'Sleep Problems'),
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  mainGroupAlignment: MainGroupAlignment.start,
                  groupRunAlignment: GroupRunAlignment.center,
                  crossGroupAlignment: CrossGroupAlignment.start,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: [
                    'Panic Attacks',
                    'Stress',
                    'Sleep Problems',
                    'Depression',
                    'Accepting Yourself'
                  ],
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  buttonHeight: size.height * 0.035,
                  unselectedColor: Colors.transparent,
                  selectedColor: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(30),
                  unselectedBorderColor:
                      Theme.of(context).canvasColor.withOpacity(0.2),
                  groupingType: GroupingType.wrap,
                ),
              ),

              AboutMyself(
                text: 'Family',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width / 1.45,
                ),
              ),

              //?Family Chapter
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 11),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ManButton(
              //         text: 'Panic attacks',
              //         bGcolor: Theme.of(context).buttonColor,
              //         textColor: Theme.of(context).primaryColor,
              //       ),
              //       ManButton(text: 'Stress'),
              //       ManButton(text: 'Sleep Problems')
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: [
                    'Panic Attacks',
                    'Stress',
                    ' Sleep Problems',
                    'Depression',
                    'Accepting Yourself'
                  ],
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  selectedTextStyle: TextStyle(fontWeight: FontWeight.normal),
                  buttonHeight: size.height * 0.03,
                  unselectedColor: Colors.transparent,
                  selectedColor: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(30),
                  unselectedBorderColor:
                      Theme.of(context).canvasColor.withOpacity(0.2),
                  groupingType: GroupingType.wrap,
                ),
              ),

              //?DEPRESSION SUBSECTION
              // Container(
              //   margin: EdgeInsets.only(bottom: 17),
              //   child: Row(
              //     children: [
              //       ManButton(
              //         text: 'Depression',
              //         bGcolor: Theme.of(context).buttonColor,
              //         textColor: Theme.of(context).primaryColor,
              //       ),
              //       SizedBox(
              //         width: size.width * 0.04,
              //       ),
              //       ManButton(text: 'Accepting yourself'),
              //     ],
              //   ),
              // ),

              //?2ND CHAPTER OF FAMILY
              AboutMyself(
                text: 'Family',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width / 1.45,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: [
                    'Panic Attacks',
                    'Stress',
                    ' Sleep Problems',
                    'Accepting Yourself',
                    'Accepting Yourself',
                    'Panic Attacks',
                    'Stress',
                    ' Sleep Problems',
                    'Depression',
                    'Accepting Yourself'
                  ],
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  selectedTextStyle: TextStyle(fontWeight: FontWeight.normal),
                  buttonHeight: size.height * 0.03,
                  unselectedColor: Colors.transparent,
                  selectedColor: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(30),
                  unselectedBorderColor:
                      Theme.of(context).canvasColor.withOpacity(0.2),
                  groupingType: GroupingType.wrap,
                ),
              ),

              //?3rd CHAPTER OF FAMILY
              Container(
                margin: EdgeInsets.only(top: 12),
                child: AboutMyself(
                  text: 'Family',
                  divider: Container(
                    height: 0.2,
                    color: Theme.of(context).canvasColor,
                    width: size.width / 1.45,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: [
                    'Panic Attacks',
                    'Stress',
                    ' Sleep Problems',
                    'Accepting Yourself',
                    'Accepting Yourself',
                    'Panic Attacks',
                    'Stress',
                    ' Sleep Problems',
                    'Depression',
                    'Accepting Yourself'
                  ],
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).highlightColor,
                  ),
                  selectedTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    // color: Theme.of(context).highlightColor,
                  ),
                  buttonHeight: size.height * 0.035,
                  unselectedColor: Colors.transparent,
                  selectedColor: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(30),
                  unselectedBorderColor:
                      Theme.of(context).canvasColor.withOpacity(0.2),
                  groupingType: GroupingType.wrap,
                ),
              ),

              // SleepProblemsRow(
              //   bGcolor: Theme.of(context).buttonColor,
              //   textColor: Theme.of(context).primaryColor,
              // ),
              // DepressionAcceptingRow(size: size),
              // SleepProblemsRow(
              //   bGcolor: Theme.of(context).buttonColor,
              //   textColor: Theme.of(context).primaryColor,
              // ),
              // DepressionAcceptingRow(size: size),

              // //?APPLY BUTTON
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
