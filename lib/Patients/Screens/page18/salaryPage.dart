import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:medical_app/Patients/Widgets/page15/numberSessionSumRow.dart';
import 'package:medical_app/Patients/Widgets/page15/paymentNumberSessionRow.dart';

class SalaryPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getDoctorSalary() async => await db
      .collection('doctors')
      .doc('doctorsID')
      .collection('Profiles')
      .doc('kwJxtEME34ghgT72wEe0')
      .collection('Payments')
      .get();
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
            Text(
              'Salary per hour',
              style: TextStyle(
                color: Theme.of(context).canvasColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '2900 ₽',
            ),
            SizedBox(height: 5),
            Container(
              height: 0.8,
              color: Theme.of(context).canvasColor,
              width: size.width * 0.85,
            ),
            SizedBox(height: size.height * 0.045),
            Align(
              child: Text('Payments'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              child: NumberSessionSumRow(),
            ),
            FutureBuilder(
                future: getDoctorSalary(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs
                          .map(
                            (document) => Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: PaymentNumberSessionRow(
                                  leading: document['number'],
                                  name: document['name'],
                                  date: document['date'],
                                  sum: '${document['price']}₽'),
                            ),
                          )
                          .toList(),
                      shrinkWrap: true,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
