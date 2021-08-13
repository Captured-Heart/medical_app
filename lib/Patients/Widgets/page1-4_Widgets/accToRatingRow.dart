import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:medical_app/Patients/Screens/page1-4/docFilters.dart';


class AccToRatingRow extends StatelessWidget {
  const AccToRatingRow({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.001,
        top: size.height * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: INSERT THE RIGHT ICONS IN PLACE
          Row(
            children: [
              Transform.rotate(
                angle: 180 * math.pi / 40,
                child: Icon(
                  FontAwesomeIcons.exchangeAlt,
                  size: 13,
                ),
              ),
              SizedBox(width: 5),
              AutoSizeText('According to the rating'),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DocFilters()));
            },
            child: Row(
              children: [
                AutoSizeText('Filter'),
                SizedBox(width: 5),
                Icon(FontAwesomeIcons.slidersH, size: 13)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
