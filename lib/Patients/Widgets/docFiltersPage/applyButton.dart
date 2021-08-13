import 'package:flutter/material.dart';

class ApplyButton extends StatelessWidget {
  final press;

  final String text;

  final num horizontal;

  const ApplyButton({
    Key? key,
    required this.size,
    this.press,
    required this.text,
    required this.horizontal,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).buttonColor,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: size.width * horizontal,
              vertical: size.height * 0.02),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor,)
      ),
    );
  }
}
