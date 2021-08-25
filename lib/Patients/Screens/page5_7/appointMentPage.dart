import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'linkCard.dart';

class AppointMentPage extends StatefulWidget {
  static const String routes = 'appointmentPage';
  final String? reviewsId;

  const AppointMentPage({Key? key, this.reviewsId}) : super(key: key);

  @override
  _AppointMentPageState createState() => _AppointMentPageState();
}

class _AppointMentPageState extends State<AppointMentPage> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List<String> timeOfReceipt = [
    '12:30',
    '14:00',
    '15:30',
    '17:00',
  ];
  String? dateFormatted2(DateTime now) {
    var formatter = DateFormat(" MMM d");
    String formatted = formatter.format(now);

    return formatted;
  }

  String? timeChosen;
  @override
  void initState() {
    super.initState();
    print(widget.reviewsId);
    _selectedDay = _focusedDay;
    timeChosen = timeOfReceipt[2];
  }

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
              height: size.height * 0.57,
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                rowHeight: 50,
                // availableCalendarFormats: ,
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
                    child: GroupButton(
                      // isRadio: false,

                      spacing: 10,
                      runSpacing: 10,
                      mainGroupAlignment: MainGroupAlignment.start,
                      groupRunAlignment: GroupRunAlignment.center,
                      crossGroupAlignment: CrossGroupAlignment.start,
                      onSelected: (index, isSelected) {
                        setState(() {
                          timeChosen = timeOfReceipt[index];
                        });
                      },
                      selectedButton: 2,
                      buttons: timeOfReceipt,

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
                  )
                ],
              ),
            ),
            // Spacer(),
            ApplyButton(
              size: size,
              text: 'Sign up for${dateFormatted2(_selectedDay!)}, $timeChosen',
              horizontal: 0.1,
              press: () {
                print(timeChosen);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LinkCardPage(
                    time: timeChosen!,
                    date: dateFormatted2(_selectedDay!)!,
                    docId: widget.reviewsId!,
                  )),
                );
                // Navigator.pushNamed(context, LinkCardPage.routes);/
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
      padding: EdgeInsets.zero,
      icon: Icon(Icons.arrow_back_ios),
      iconSize: 20.0,
      onPressed: () {
        Navigator.pushReplacementNamed(context, MyHomePage.routes);
      },
    );
  }
}
