import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';
import 'package:table_calendar/table_calendar.dart';

import 'linkCard.dart';

class AppointMentPage extends StatefulWidget {
  static const String routes = 'appointmentPage';

  @override
  _AppointMentPageState createState() => _AppointMentPageState();
}

class _AppointMentPageState extends State<AppointMentPage> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: BackIconToHomePage(),
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
              text: 'Sign up for May 26 12:30',
              horizontal: 0.1,
              press: () {
                Navigator.pushNamed(context, LinkCardPage.routes);
              },
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}

class BackIconToHomePage extends StatelessWidget {
  const BackIconToHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      iconSize: 20.0,
      onPressed: () {
    Navigator.pushReplacementNamed(context, MyHomePage.routes);

      },
    );
  }
}
