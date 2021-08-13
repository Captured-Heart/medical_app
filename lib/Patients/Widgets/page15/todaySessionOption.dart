import 'package:flutter/material.dart';

class TodaySessionOption extends StatelessWidget {
  final String subtitle2, subtitle1, title, imageString;

  final Color subtitle2Color;

  final Widget? beginButton;

  const TodaySessionOption({
    Key? key,
    required this.size,
    required this.subtitle2,
    required this.subtitle1,
    required this.title,
    required this.subtitle2Color,
    required this.imageString,
    this.beginButton,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        // height: size.height * 0.092,
        child: ListTile(
          leading: ClipRRect(
            child: Image.asset(imageString),
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            // 'Ivanov Ivan',
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Theme.of(context).highlightColor,
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: subtitle1,
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                TextSpan(
                  text: subtitle2,
                  style: TextStyle(color: subtitle2Color),
                )
              ],
            ),
          ),

          // Text('17:00 | In 00:05'),
          trailing: beginButton,

          // tileColor: Colors.grey,
          dense: true,
          shape: Border.all(
            style: BorderStyle.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.018,
          ),
        ),
      ),
    );
  }
}