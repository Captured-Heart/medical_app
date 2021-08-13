import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EducationSpecializationRow extends StatelessWidget {
  const EducationSpecializationRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.020),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Education',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.thLarge,
                size: 15,
                color: Theme.of(context).highlightColor,
              ),
              SizedBox(width: 8),
              Text(
                'Specializations',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Icon(FontAwesomeIcons.solidThumbsUp, size: 15),
                SizedBox(width: 8),
                Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
