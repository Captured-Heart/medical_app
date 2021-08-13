import 'package:flutter/material.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      color: Color(0xff4FCF7A),
      child: Text(
        '15% discount on the first session left 2:15:34',
        textAlign: TextAlign.center,

        //TODO: set default TextColor acc to the mode(light or dark)
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}