import 'package:auto_size_text/auto_size_text.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class SettingsRecordTimes extends StatefulWidget {
  @override
  _SettingsRecordTimesState createState() => _SettingsRecordTimesState();
}

class _SettingsRecordTimesState extends State<SettingsRecordTimes> {
  bool recordingTime = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: !recordingTime
          ? Theme.of(context).primaryColor
          : Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            recordingTime = !recordingTime;
          });
        },
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(
          // FontAwesomeIcons.plus,
          Icons.add,
          size: 38,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            !recordingTime
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.height * 0.11,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.angleLeft,
                            color: Theme.of(context).highlightColor,
                          ),
                        ],
                      ),
                    ),
                  )
                : Text(''),
            recordingTime ? CreateRecordingTime(size: size) : Container(height: 0),
            !recordingTime
                ? ScheduleOptions(
                    size: size,
                  )
                : Container(height: 0),
          ],
        ),
      ),
    );
  }
}

class ScheduleOptions extends StatelessWidget {
  const ScheduleOptions({
    Key? key,
    required this.size,
    this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: ListView(
          children: [
            RecordingTimesOptions(
              time: '14:00',
              days: 'Mon, Tue, Wed, Thu, Fri',
              press: press,
            ),
            RecordingTimesOptions(
              time: '15:30',
              days: 'Mon, Tue, Wed, Thu, Fri',
            ),
            RecordingTimesOptions(
              time: '17:00',
              days: 'Mon, Tue, Wed',
            ),
            RecordingTimesOptions(
              time: '18:30',
              days: 'Mon, Tue, Wed',
            ),
          ],
        ),
      ),
    );
  }
}

class CreateRecordingTime extends StatelessWidget {
  const CreateRecordingTime({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2.2,
      decoration: BoxDecoration(
        color:
            // Colors.amber,
            Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SettingsRecordsDays(
                  size: size,
                  days: 'Mo',
                  textColor: Theme.of(context).primaryColor,
                  bGcolor: Theme.of(context).buttonColor,
                ),
                SettingsRecordsDays(
                  size: size,
                  days: 'Tu',
                  textColor: Theme.of(context).primaryColor,
                  bGcolor: Theme.of(context).buttonColor,
                ),
                SettingsRecordsDays(
                  size: size,
                  days: 'We',
                  textColor: Theme.of(context).primaryColor,
                  bGcolor: Theme.of(context).buttonColor,
                ),
                SettingsRecordsDays(
                  size: size,
                  days: 'Th',
                  textColor: Theme.of(context).primaryColor,
                  bGcolor: Theme.of(context).buttonColor,
                ),
                SettingsRecordsDays(
                    size: size,
                    days: 'Fr',
                    textColor: Theme.of(context).highlightColor,
                    bGcolor: Theme.of(context).primaryColor),
                SettingsRecordsDays(
                    size: size,
                    days: 'Sa',
                    textColor: Theme.of(context).highlightColor,
                    bGcolor: Theme.of(context).primaryColor),
                SettingsRecordsDays(
                    size: size,
                    days: 'Su',
                    textColor: Theme.of(context).highlightColor,
                    bGcolor: Theme.of(context).primaryColor),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            height: 110,
            child: Center(
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                textAlign: TextAlign.center,
                maxLength: 4,
                style: TextStyle(
                  fontSize: 60,
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).buttonColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                  isDense: true,
                  // labelText: '00:00',
                  hintText: '00:00',
                  hintStyle: TextStyle(
                    fontSize: 60,
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                inputFormatters: [
                  CreditCardFormatter(separator: ':'),
                ],
                cursorColor: Theme.of(context).buttonColor,
                showCursor: false,
              ),
            ),
          ),
          ApplyButton(size: size, text: 'Add', horizontal: 0.28)
        ],
      ),
    );
  }
}

class SettingsRecordsDays extends StatelessWidget {
  const SettingsRecordsDays({
    Key? key,
    required this.size,
    required this.bGcolor,
    required this.textColor,
    required this.days,
  }) : super(key: key);

  final Size size;
  final Color bGcolor, textColor;
  final String days;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.087,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        color: bGcolor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).accentColor, width: 0.2),
      ),
      child: Center(
        child: AutoSizeText(
          days,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class RecordingTimesOptions extends StatelessWidget {
  const RecordingTimesOptions({
    Key? key,
    required this.days,
    required this.time,
    this.press,
  }) : super(key: key);
  final String days, time;
  final press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        time,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      title: AutoSizeText(
        days,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
      trailing: GestureDetector(
        onTap: press,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).buttonColor,
        ),
      ),
      dense: true,
    );
  }
}
