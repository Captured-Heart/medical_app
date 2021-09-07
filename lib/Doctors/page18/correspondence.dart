import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page15/chatPage.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';

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
                                name: '${document['docName']} ' +
                                    document['surname'],
                                showBadge: true,
                                badgeNumber: '3',
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

  final AuthMethods authMethods = AuthMethods();
  Stream<QuerySnapshot> getCorrespondenceStreams(BuildContext context) async* {
    final uid = await authMethods.getCurrentUID();
    yield* db
        .collection('doctors')
        .doc(uid)
        .collection('Correspodence')

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              imageUrl: imageUrl,
              name: name,
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
