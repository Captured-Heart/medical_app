import 'package:flutter/material.dart';

class CorrespondenceSubSection extends StatelessWidget {
  final String title;
  final Widget trailingWidget, leadingWidget;

  const CorrespondenceSubSection({
    Key? key,
    required this.size,
    required this.title,
    required this.trailingWidget,
    required this.leadingWidget,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      margin: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.1),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12), child: leadingWidget),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          )),
          trailingWidget
        ],
      ),
    );
  }
}
