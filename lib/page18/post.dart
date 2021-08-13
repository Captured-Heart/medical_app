import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/page18/settingRecords.dart';
import 'package:medical_app/page18/transferRecordingPage.dart';
import 'package:table_calendar/table_calendar.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool editOption = true;
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsRecordTimes()));
              },
              child: Icon(
                Icons.settings,
                color: Theme.of(context).buttonColor,
              ),
            ),
          )
        ],
        toolbarHeight: size.height * 0.1,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
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
            ),
            Container(
              height: size.height * 0.33,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Recordings on May 27',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            editOption = !editOption;
                          });
                        },
                        child: editOption
                            ? Icon(Icons.edit)
                            : Icon(Icons.check, size: 28),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          RecordingsOptions(
                            title: 'Oleg',
                            subtitle: '14:00',
                            imageUrl: 'assets/images/oleg.jpg',
                            trailing: !editOption
                                ? Text(
                                    'Move',
                                    style: TextStyle(
                                        color: Theme.of(context).buttonColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(''),
                          ),
                          Container(
                            height: size.height * 0.07,
                            margin: EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Spacer(flex: 3),
                                Text(
                                  '15:30 no record',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(flex: 6),
                                !editOption
                                    ? Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Color(0xffF47E7E),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : Text(''),
                                Spacer(),
                              ],
                            ),
                          ),
                          RecordingsOptions(
                            title: 'Николай',
                            subtitle: '17:00',
                            imageUrl: 'assets/images/peter.png',
                            trailing: !editOption
                                ? Text(
                                    'Move',
                                    style: TextStyle(
                                      color: Theme.of(context).buttonColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(''),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecordingsOptions extends StatelessWidget {
  const RecordingsOptions({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.trailing,
  }) : super(key: key);
  final String title, subtitle, imageUrl;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        dense: true,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/oleg.jpg',
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransferRecording()));
            },
            child: trailing,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
