import 'package:flutter/material.dart';

class PaymentNumberSessionRow extends StatelessWidget {
  final String leading, sum, name, date;

  const PaymentNumberSessionRow({
    Key? key,
    required this.leading,
    required this.sum,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leading,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // 'Ivanov Ivan',
              name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              date,
              // 'May 21, 17:00',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(flex: 4),
        Text(
          sum,
          // '2900₽',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
