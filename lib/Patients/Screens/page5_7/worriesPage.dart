import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/filterOptions.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/doctorProfileCard.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';

class WorriesPage extends StatefulWidget {
  @override
  _WorriesPageState createState() => _WorriesPageState();
}

class _WorriesPageState extends State<WorriesPage> {
  final List<String> workList = [
    'Panic Attacks',
    'Stress',
    'Sleep Problems',
    'Depression',
    'Accepting Yourself'
  ];

  final List<String> familyList1 = [
    'Panic Attacks',
    'Stress',
    ' Sleep Problems',
    'Depression',
    'Accepting Yourself'
  ];

  final List<String> familyList2 = [
    'Panic Attacks',
    'Stress',
    ' Sleep Problems',
    'Depression',
    'Accepting Yourself',
    'Panic Attacks',
    'Stress',
    'Sleep Problems',
    'Depression',
    'Accepting Yourself'
  ];

  final List<String> familyList3 = [
    'Panic Attacks',
    'Stress',
    ' Sleep Problems',
    'Depression',
    'Accepting Yourself',
  ];
  final List<String> familyList4 = [
    'Panic Attacks',
    'Stress',
    ' Sleep Problems',
    'Depression',
    'Accepting Yourself'
  ];

  String? workListOption;

  String? familyList1Option;

  String? familyList2Option;

  String? familyList3Option;
  String? familyList4Option;

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

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: GroupButton(
                  spacing: 10,
                  runSpacing: 10,
                  mainGroupAlignment: MainGroupAlignment.start,
                  groupRunAlignment: GroupRunAlignment.center,
                  crossGroupAlignment: CrossGroupAlignment.start,
                  onSelected: (index, isSelected) {
                    setState(() {
                      workListOption = workList[index];
                    });
                  },
                  buttons: workList,
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
//! 2
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  // isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) {
                    setState(() {
                      familyList1Option = familyList1[index];
                    });
                  },
                  buttons: familyList1,
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

              //?2ND CHAPTER OF FAMILY
              AboutMyself(
                text: 'Family',
                divider: Container(
                  height: 0.2,
                  color: Theme.of(context).canvasColor,
                  width: size.width / 1.45,
                ),
              ),

              //! 3
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  // isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) {
                    setState(() {
                      familyList2Option = familyList2[index];
                    });
                  },
                  buttons: familyList2,
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

              //! 4
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  // isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) {
                    setState(() {
                      familyList3Option = familyList3[index];
                    });
                  },
                  buttons: familyList3,
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

              //!  5
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: GroupButton(
                  // isRadio: false,
                  spacing: 10,
                  runSpacing: 10,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  onSelected: (index, isSelected) {
                    setState(() {
                      familyList4Option = familyList4[index];
                    });
                  },
                  buttons: familyList4,
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

              // //?APPLY BUTTON
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ApplyButton(
                    size: size,
                    text: 'Apply',
                    horizontal: 0.25,
                    press: () {
                      print(workListOption!.toString());

                      print(familyList1Option!.toString());
                      print(familyList2Option!.toString());
                      print(familyList3Option!.toString());
                      print(familyList4Option!.toString());

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilterOptions(
                                    size: size,
                                    // workListOption: workListOption!.toString(),
                                    // familyList1Option:
                                    //     familyList1Option!.toString(),
                                    // familyList2Option:
                                    //     familyList2Option!.toString(),
                                    // familyList3Option:
                                    //     familyList3Option!.toString(),
                                    // familyList4Option:
                                    //     familyList4Option!.toString(),
                                  )));
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
