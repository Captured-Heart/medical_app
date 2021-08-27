import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/doctorProfileCard.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';

class AllAndFavTabBarView extends StatefulWidget {
  const AllAndFavTabBarView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _AllAndFavTabBarViewState createState() => _AllAndFavTabBarViewState();
}

class _AllAndFavTabBarViewState extends State<AllAndFavTabBarView> {
  AuthMethods authMethods = AuthMethods();
  var db = FirebaseFirestore.instance;
  dynamic data;
  dynamic docId;

  // Future<dynamic> getData(BuildContext context) async {
  //   // final uid = await authMethods.getCurrentUID();

  //   final DocumentReference document = FirebaseFirestore.instance
  //       .collection('doctors')
  //       .doc('doctorsID')
  //       .collection('Profiles')
  //       .doc('kwJxtEME34ghgT72wEe0');

  //   await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
  //     setState(() {
  //       docId = snapshot.id;
  //       // data = snapshot.docs.first;
  //       // print(docId);
  //     });
  //   });
  //   // docId = document.document().documentID;
  // }

  @override
  void initState() {
    super.initState();
    // getData(context);
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: widget.size.height / 1.45,
            child: TabBarView(
              // controller: TabController,
              children: [
                FutureBuilder(
                    future: getDoctorsStreams(),
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
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, int index) {
                          return buildDoctorsProfileCard(
                            context,
                            snapshot.data!.docs[index],
                          );
                        },
                      );
                      //  ListView(
                      //   children: snapshot.data!.docs
                      //       .map(
                      //         (document) =>
                      //             //?ALL DOCTORS
                      //             DoctorsProfileCard(
                      //           size: widget.size,
                      //           name: document['name'],
                      //           imageUrl: document['imageUrl'],
                      //           occupation: document['occupation'],
                      //           years: document['years'],
                      //           about: document['about'],
                      //           salary: document['salary'],
                      //           time: document['time'],
                      //           ratings: document['rating'],
                      //           // reviewsId: ,
                      //         ),
                      //       )
                      //       .toList(),
                      // );
                    }),

                //? FAVOURITES TABVIEW
                FutureBuilder(
                    future: getFavouritesStreams(),
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
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, int index) {
                          return buildDoctorsFavProfileCard(
                            context,
                            snapshot.data!.docs[index],
                          );
                        },
                      );

                      // ListView(
                      //   children: snapshot.data!.docs.map((documents) {
                      //     return DoctorsProfileCard(
                      //       size: widget.size,
                      //       name: 'Petrov Peter',
                      //       imageUrl: documents['imageUrl'],
                      //       occupation: 'Psychotherapist',
                      //       years: '10',
                      //       about: 'ndkcdjvkds',
                      //       salary: '2900',
                      //       time: '38',
                      //       ratings: '4',
                      //       // reviewsId: ,
                      //     );
                      //   }).toList(),
                      // );
                    }),
              ],
            )),
      ],
    );
  }

  DoctorsProfileCard buildDoctorsProfileCard(
      BuildContext context, DocumentSnapshot document) {
    Future getData(context) async {
      final doc = FirebaseFirestore.instance
          .collection('doctors')
          .doc('doctorsID')
          .collection('Profiles')
          .doc(document.id);
      // var docIDD = document.id;
      return await doc.get();
    }

    return DoctorsProfileCard(
      size: widget.size,
      name: document['name'],
      imageUrl: document['imageUrl'],
      occupation: document['occupation'],
      years: document['years'],
      about: document['about'],
      salary: document['salary'],
      time: document['time'],
      ratings: document['rating'],
      docId: document.id,
      // reviewsId: ,
    );
  }

  DoctorsProfileCard buildDoctorsFavProfileCard(
      BuildContext context, DocumentSnapshot documents) {
    Future getData2(context) async {
      final uuid = await authMethods.getCurrentUID();
      final docss = FirebaseFirestore.instance
          .collection('patients')
          .doc(uuid)
          .collection('favourites')
          .doc(documents.id);
      return await docss.get();
    }

    return DoctorsProfileCard(
      docId: documents.id,
      size: widget.size,
      name: documents['name'],
      imageUrl: documents['imageUrl'],
      occupation: documents['occupation'],
      years: documents['years'],
      about: documents['about'],
      salary: documents['salary'],
      time: documents['time'],
      ratings: documents['ratings'],
      // reviewsId: ,
    );
  }

  // Stream<QuerySnapshot> getDoctorsStreams(BuildContext context) async* {
  //   // final uid = await authMethods.getCurrentUID();

  //   yield* db
  //       .collection('doctors')
  //       .doc('doctorsID')
  //       .collection('Profiles')
  //       // .orderBy('dateCreated', descending: true)
  //       .snapshots();
  // }

  // Stream<QuerySnapshot> getPatientsStreams(BuildContext context) async* {
  //   yield* db
  //       .collection('patients')
  //       .doc('patientsID')
  //       .collection('favourites')
  //       // .orderBy('dateCreated', descending: true)
  //       .snapshots();
  // }

  Future<QuerySnapshot> getDoctorsStreams() async => await db
      .collection('doctors')
      .doc('doctorsID')
      .collection('Profiles')
      .get();

  Future<QuerySnapshot> getFavouritesStreams() async {
    final uuid = await authMethods.getCurrentUID();

    return await db
        .collection('patients')
        .doc(uuid)
        .collection('favourites')
        .get();
  }
}
