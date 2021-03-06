import 'package:flutter/material.dart';

class CorrespondenceSubSection extends StatelessWidget {
  final String title;
  final Widget trailingWidget;
  final ImageProvider leadingWidget;

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
      height: size.height * 0.055,
      margin: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.1),
      child: Row(
        children: [
          Container(
            height: 105,
            width: 55,
            // borderRadius: BorderRadius.all(Radius.circular(50)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: leadingWidget)
            ),
            // child: leadingWidget,
          ),
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
