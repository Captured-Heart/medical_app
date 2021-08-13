import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';

import 'profileOptions.dart';

class CorrespondenceProfileOptions extends StatelessWidget {
  const CorrespondenceProfileOptions({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: 'Correspondence',
        icon: FontAwesomeIcons.solidCommentDots,
        trailingIcon: correspondenceExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        // press: press,
        tileColor: correspondenceExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        leadingWidget: !correspondenceExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCommentDots,
                  size: 18,
                  color: correspondenceExpand
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
                  FontAwesomeIcons.solidCommentDots,
                  size: 18,
                  color: correspondenceExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
        leadingIconColor: correspondenceExpand
            ? Colors.blue
            : Theme.of(context).highlightColor,
      ),
    );
  }
}