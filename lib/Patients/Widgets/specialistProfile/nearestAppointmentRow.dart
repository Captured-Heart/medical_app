import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NearestAppointmentRow extends StatelessWidget {
  const NearestAppointmentRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText('Nearest appointment: 12:30'),
          Text('2900₽ / hour')
        ],
      ),
    );
  }
}
