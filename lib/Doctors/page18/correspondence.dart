import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';

class CorrespondencePage extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackIcon(),
        title: Text(
          'Correspondence',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.045),
          child: Column(
            children: [
              StreamBuilder(
                  stream: getCorrespondenceStreams(context),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map(
                              (document) => CorrespondenceOptions(
                                size: size,
                                imageUrl: document['imageUrl'],
                                name: document['name'],
                                showBadge: true,
                                badgeNumber: document['badge'],
                              ),
                            )
                            .toList(),
                        shrinkWrap: true,
                      );
                    } else {
                      return Text('');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getCorrespondenceStreams(BuildContext context) async* {
    yield* db
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc('kwJxtEME34ghgT72wEe0')
        .collection('Correspondence')
        // .orderBy('dateCreated', descending: true)
        .snapshots();
  }
}
// final uuid = await authMethods.getCurrentUID();

class CorrespondenceOptions extends StatelessWidget {
  final bool showBadge;

  final String badgeNumber;

  const CorrespondenceOptions({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.name,
    required this.showBadge,
    required this.badgeNumber,
  }) : super(key: key);
  final Size size;
  final String imageUrl, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 60,
      padding: EdgeInsets.only(top: size.height * 0.009),
      child: Row(
        children: [
          Container(
            height: 37,
            width: 65,

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    imageUrl,
                    maxHeight: 105,
                  ),
                )),
            // child: leadingWidget,
          ),
          SizedBox(width: 10),
          Badge(
            badgeContent: Text(
              badgeNumber,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
            showBadge: showBadge,
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(3),
            position: BadgePosition.topEnd(end: -15),
            child: Text(name),
          ),
          Spacer(),
          Text(
            'Look',
            style: TextStyle(
              color: Theme.of(context).buttonColor,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          )
        ],
      ),
    );
  }
}
