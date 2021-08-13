import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page15/patientsProfile.dart';

import 'profileOptions.dart';

class PaymentProfileOptions extends StatelessWidget {
  const PaymentProfileOptions({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: 'Payments',
        icon: FontAwesomeIcons.solidCommentDots,
        trailingIcon: paymentExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        // press: press,
        tileColor: paymentExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        leadingWidget: !paymentExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCreditCard,
                  size: 18,
                  color: paymentExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCreditCard,
                  size: 18,
                  color: paymentExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
        leadingIconColor:
            paymentExpand ? Colors.blue : Theme.of(context).highlightColor,
      ),
    );
  }
}
