import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';

import 'package:medical_app/Patients/Widgets/page15/numberSessionSumRow.dart';
import 'package:medical_app/Patients/Widgets/page15/paymentNumberSessionRow.dart';
import 'package:flash/flash.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';
import 'package:collection/collection.dart';

class SalaryPage extends StatefulWidget {
  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  final db = FirebaseFirestore.instance;

  void _showDialogFlash({
    bool persistent = true,
    double vertical = 22,
    double horizontal = 20,
  }) {
    context.showFlashDialog(
      persistent: persistent,
      backgroundColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      content: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Center(
          child: Text(
            'The salary will be credited to your card shortly',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  AuthMethods authMethods = AuthMethods();

  Future<QuerySnapshot> getDoctorSalary() async {
    final uid = await authMethods.getCurrentUID();
    return await db.collection('doctors').doc(uid).collection('Payments').get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
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
        child: FutureBuilder(
            future: getDoctorSalary(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.none)
                return Center(
                  child: Icon(
                    Icons.error,
                    size: 100,
                  ),
                );
              // final list = [9.8,9];
              // final sum = list.sum;

              //!ADD SUM OF ALL SNAPSHOTS OF 'PRICE'
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: size.height * 0.20,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '12600₽',
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontSize: 36),
                              ),
                              Text('available for withdrawal'),
                            ],
                          ),
                          ApplyButton(
                            size: size,
                            text: 'withdraw',
                            horizontal: 0.27,
                            press: () {
                              _showDialogFlash();
                            },
                          )
                        ],
                      )),
                  Text(
                    'Salary per hour',
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('${snapshot.data!.docs.first.get('price')} ₽'
                      // '$snapshot. ₽',
                      ),
                  SizedBox(height: 5),
                  Container(
                    height: 0.8,
                    color: Theme.of(context).canvasColor,
                    width: size.width * 0.85,
                  ),
                  SizedBox(height: 13),
                  Text(
                    'Card Number',
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '5368 3829 9384 8474',
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
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.015),
                    child: NumberSessionSumRow(),
                  ),
                  FutureBuilder(
                      future: getDoctorSalary(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return ListView(
                            children: snapshot.data!.docs
                                .map(
                                  (document) => Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: PaymentNumberSessionRow(
                                      leading: document['number'],
                                      name: '${document['name']} ' +
                                          document['surname'],
                                      date: '${document['date']}, ' +
                                          '${document['time']}',
                                      sum: '${document['price']}₽',
                                    ),
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
              );
            }),
      ),
    );
  }
}
