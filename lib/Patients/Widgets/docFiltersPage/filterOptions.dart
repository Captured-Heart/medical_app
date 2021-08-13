import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page18/profileSettings.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/advSettings.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    Key? key,
    required this.size,
    required this.advSettings,
    this.press,
  }) : super(key: key);

  final Size size;
  final bool advSettings;
  final press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: advSettings ? size.height * 0.53 : size.height * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(40),
          bottomStart: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: size.height * 0.03),
          AutoSizeText('Who are you more comfortable working with?',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Theme.of(context).highlightColor,
              )),
          SizedBox(height: size.height * 0.03),

          //?MAN, WOMAN ROWOPTIONS (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          ManWomanRowOptions(
            text: 'Man',
            text2: 'Woman',
            text3: 'No Matter',
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            'What worries you?',
            style: TextStyle(fontSize: size.width * 0.04),
          ),
          SizedBox(height: size.height * 0.03),

          //?ADD, PANIC ATTACKS (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          AddPanicAttacksRowOptions(),
          SizedBox(height: size.height * 0.02),

          //?SLEEP PROBLEMS RowOptions (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          SleepProblemsRowOptions(),
          // SizedBox(height: size.height * 0.008),

          //?ADVANCED SETTINGS BUTTON
          AdvancedSettingsRow(
            size: size,
            iconWidget: advSettings
                ? Icon(Icons.arrow_drop_down)
                : Icon(Icons.arrow_drop_up),
            press: press,
          ),

          //?ADD 2 SLIDERS
          !advSettings
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: LanguageFormInput(
                    size: size,
                    text: 'Language',
                  ),
                )
              : Container(height: 0),
          SizedBox(height: size.height * 0.00005),
          //? TRY TO SEE IF YOU CAN EDIT TEXTBUTTON THEME IN THE THEME
          Spacer(
            flex: 5,
          ),

          ApplyButton(
            size: size,
            text: 'Apply',
            horizontal: 0.25,
            press: (){
              Navigator.pushReplacementNamed(context, MyHomePage.routes);
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
