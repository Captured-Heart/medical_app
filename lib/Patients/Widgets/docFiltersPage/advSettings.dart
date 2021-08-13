import 'package:flutter/material.dart';

class AdvancedSettingsRow extends StatelessWidget {
  const AdvancedSettingsRow({
    Key? key,
    required this.size,
    required this.iconWidget,
    this.press,
  }) : super(key: key);

  final Size size;
  final Widget iconWidget;
  final press;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.03,
        horizontal: size.width * 0.03,
      ),
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            iconWidget,
            Expanded(
              child: Text(
                'Advanced Settings',
                style: TextStyle(
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
            // SizedBox(width: 20,),
            Container(
              height: 0.2,
              color: Theme.of(context).accentColor,
              width: size.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
