import 'package:flutter/material.dart';

class NumberSessionSumRow extends StatelessWidget {
  const NumberSessionSumRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Number',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
        Spacer(),
        Text(
          'Session',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
        Spacer(flex: 4),
        Text(
          'Sum',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
      ],
    );
  }
}
