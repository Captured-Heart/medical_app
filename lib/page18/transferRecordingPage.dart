import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/page1/topHeader.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flash/flash.dart';

class TransferRecording extends StatefulWidget {
  @override
  _TransferRecordingState createState() => _TransferRecordingState();
}

class _TransferRecordingState extends State<TransferRecording> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _showDialogFlash({
    bool persistent = true,
    double vertical = 22,
    double horizontal = 20,
  }) {
    context.showFlashDialog(
        persistent: persistent,
        backgroundColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(25),
        content: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: Center(
            child: Text(
              '''Do you really want to transfer patient Oleg's appointment from 14:00 on May 27 at 17:30 on May 27?''',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        negativeActionBuilder: (context, controller, _) {
          return TextButton(
            onPressed: () {
              controller.dismiss();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).scaffoldBackgroundColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                textStyle: MaterialStateProperty.all(TextStyle()),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                )),
            child: Text('NO'),
          );
        },
        positiveActionBuilder: (context, controller, _) {
          return TextButton(
            onPressed: () {
              controller.dismiss();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).scaffoldBackgroundColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                )),
            child: Text('YES'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: size.height * 0.53,
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 3, 14),
                lastDay: DateTime.utc(2030, 3, 14),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                    print(selectedDay.toString());
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).buttonColor.withOpacity(0.4),
                    // borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.12,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time of receipt',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                      vertical: size.width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ManButton(
                          text: '12:30',
                          bGcolor: Theme.of(context).buttonColor,
                          textColor: Theme.of(context).primaryColor,
                        ),
                        ManButton(
                          text: '14:00',
                        ),
                        ManButton(
                          text: '15:30',
                        ),
                        ManButton(
                          text: '17:00',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Spacer(),
            ApplyButton(
              size: size,
              text: 'Postpone to May 26 at 12:30',
              horizontal: 0.1,
              press: () {
                _showDialogFlash();
              },
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
