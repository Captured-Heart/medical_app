import 'package:flutter/material.dart';

class RecordsSubSection extends StatelessWidget {
  final String title;
  final Widget trailingWidget, leadingWidget;

  const RecordsSubSection({
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
      height: size.height * 0.03,
      margin: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.1),
      child: Row(
        children: [leadingWidget, Expanded(child: Text(title)), trailingWidget],
      ),
    );
  }
}
