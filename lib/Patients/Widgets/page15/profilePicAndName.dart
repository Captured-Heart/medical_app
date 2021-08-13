import 'package:flutter/material.dart';

class ProfPicAndName extends StatelessWidget {
  const ProfPicAndName({
    Key? key,
    required this.size,
    required this.imgString,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String imgString, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgString,
              scale: 0.6,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
