import 'package:auto_size_text/auto_size_text.dart';
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
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.13,
          child: AutoSizeText(
            leading,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // Spacer(),
        Container(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
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
        ),
        // Spacer(),
        Container(
          child: Text(
            sum,
            // '2900₽',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
