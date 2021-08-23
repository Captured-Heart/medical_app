import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NearestAppointmentRow extends StatelessWidget {
  const NearestAppointmentRow({
    Key? key,
    required this.size, required this.salary,required this.time,
  }) : super(key: key);

  final Size size;
final String salary, time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText('Nearest appointment: $time'),
          Text('$salary₽ / hour')
        ],
      ),
    );
  }
}
