import 'package:flutter/material.dart';
import 'package:medical_app/page15/patientsProfile.dart';
import 'package:medical_app/page7/linkCard.dart';

class SalaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Salary',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormInputEmail(
              size: size,
              text: 'Salary per hour',
            ),
            Align(
              child: Text('Payments'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
              child: NumberSessionSumRow(),
            ),
            PaymentNumberSessionRow(
              leading: '345365',
              name: 'Oleg',
              date: 'May 21, 17:00',
              sum: '2900₽',
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: size.height * 0.027),
              child: PaymentNumberSessionRow(
                leading: '845365',
                name: 'Николай',
                date: 'May 19, 17:00',
                sum: '2900₽',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
