import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  final String text;

  final IconData? icon;

  final IconData? trailingIcon;

  final press;

  final Color? leadingIconColor, tileColor;

  final Widget? leadingWidget;
  final Size size;
  const ProfileOptions({
    Key? key,
    required this.text,
    this.icon,
    this.trailingIcon,
    this.press,
    this.leadingIconColor,
    this.tileColor,
    this.leadingWidget,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      leading: leadingWidget,
      trailing: GestureDetector(
        onTap: press,
        child: Icon(
          trailingIcon,
          size: 22,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      dense: true,
    );
  }
}
