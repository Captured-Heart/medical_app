import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';

import 'profileOptions.dart';

class RecordsProfileOptions extends StatelessWidget {
  final String title;

  final IconData? icon;

  const RecordsProfileOptions({
    Key? key,
    required this.size,
    this.press,
    required this.title,
    this.icon,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: title,
        trailingIcon: recordsExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        tileColor: recordsExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        // press: press,
        leadingWidget: !recordsExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: recordsExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.list,
                  size: 18,
                  color: recordsExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
      ),
    );
  }
}
