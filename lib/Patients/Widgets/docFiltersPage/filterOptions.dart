import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Screens/page18/profileSettings.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/advSettings.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';
import 'package:medical_app/start.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterOptions extends StatefulWidget {
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
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  @override
  Widget build(BuildContext context) {
    SfRangeValues _values = SfRangeValues(1500, 17500);
    SfRangeValues _values1 = SfRangeValues(10, 15);


    return Container(
      width: widget.size.width,
      height: widget.advSettings
          ? widget.size.height * 0.55
          : widget.size.height * 0.85,
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
          SizedBox(height: widget.size.height * 0.03),
          AutoSizeText('Who are you more comfortable working with?',
              style: TextStyle(
                fontSize: widget.size.width * 0.04,
                color: Theme.of(context).highlightColor,
              )),
          SizedBox(height: widget.size.height * 0.03),

          //?MAN, WOMAN ROWOPTIONS (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          GroupButton(
            isRadio: false,
            spacing: 10,
            onSelected: (index, isSelected) =>
                print('$index button is selected'),
            buttons: [
              'Man',
              'Woman',
              'No Matter',
            ],
            unselectedColor: Colors.transparent,
            selectedColor: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(30),
            unselectedBorderColor:
                Theme.of(context).canvasColor.withOpacity(0.3),
            groupingType: GroupingType.wrap,
          ),

          SizedBox(height: widget.size.height * 0.03),
          Text(
            'What worries you?',
            style: TextStyle(
              fontSize: widget.size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.size.height * 0.02),

          //?ADD, PANIC ATTACKS (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          AddPanicAttacksRowOptions(),
          SizedBox(height: widget.size.height * 0.02),

          //?SLEEP PROBLEMS RowOptions (THEY MAYBE CLICKABLE AND SENT TO THE FIRESTORE)
          SleepProblemsRowOptions(),
          // SizedBox(height: size.height * 0.008),

          //?ADVANCED SETTINGS BUTTON
          AdvancedSettingsRow(
            size: widget.size,
            iconWidget: widget.advSettings
                ? Icon(Icons.arrow_drop_down)
                : Icon(Icons.arrow_drop_up),
            press: widget.press,
          ),

          //?ADD 2 SLIDERS
          !widget.advSettings
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Specialist experience 3-12 years ')),
                    SfRangeSlider(
                      values: _values1,
                      onChanged: (SfRangeValues onChanged) {
                          setState(() {
                            _values = onChanged;
                          });
                        },
                      inactiveColor:
                          Theme.of(context).buttonColor.withOpacity(0.5),
                      activeColor: Theme.of(context).buttonColor,
                      enableIntervalSelection: true,
                      enableTooltip: true,
                      min: 0,
                      max: 25,
                      // thumbShape: Shape,
                      showLabels: true,
                      // showTicks: true,
                    ),
                    Center(child: Text('Price 1 500 - 17 500 ₽/hour')),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: widget.size.width * 0.06),
                      child: SfRangeSlider(
                        values: _values,
                        onChanged: (SfRangeValues onChanged) {
                          setState(() {
                            _values = onChanged;
                          });
                        },
                        inactiveColor:
                            Theme.of(context).buttonColor.withOpacity(0.5),
                        activeColor: Theme.of(context).buttonColor,
                        min: 1500,
                        max: 20000,
                        enableIntervalSelection: true,
                        enableTooltip: true,
                        // interval: 20,
                        // thumbShape: Shape,
                        showLabels: true,
                        // showTicks: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.size.width * 0.05, vertical: 10),
                      child: LanguageFormInput(
                        size: widget.size,
                        text: 'Language',
                      ),
                    ),
                  ],
                )
              : Container(height: 0),
          SizedBox(height: widget.size.height * 0.00005),
          //? TRY TO SEE IF YOU CAN EDIT TEXTBUTTON THEME IN THE THEME
          Spacer(
            flex: 5,
          ),

          ApplyButton(
            size: widget.size,
            text: 'Apply',
            horizontal: 0.25,
            press: () {
              //TODO:Just for testing oooo, changing it back to navigate to MYHomePage.routes
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
              // Navigator.pushReplacementNamed(context, MyHomePage.routes);
            },
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
