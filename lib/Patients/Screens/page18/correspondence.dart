import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CorrespondencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
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
              CorrespondenceOptions(
                size: size,
                imageUrl: 'assets/images/oleg.jpg',
                name: 'Oleg',
                showBadge: true,
              ),
              CorrespondenceOptions(
                size: size,
                imageUrl: 'assets/images/another.png',
                name: 'Николай',
                showBadge: false,
              )
              // ListTile(
              //   leading: Image.asset('assets/images/oleg.jpg'),
              //   title: Badge(
              //     badgeContent: Text('3'),
              //     alignment: Alignment.topRight,
              //     padding: EdgeInsets.all(3),
              //     child: Text('Oleg'),
              //   ),
              //   trailing: Text('Look'),
              //   contentPadding: EdgeInsets.zero,
              //   dense: true,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CorrespondenceOptions extends StatelessWidget {
  final bool showBadge;

  const CorrespondenceOptions({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.name, required this.showBadge,
  }) : super(key: key);
  final Size size;
  final String imageUrl, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.009),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imageUrl, scale: 0.95),
          ),
          SizedBox(width: 10),
          Badge(
            badgeContent: Text(
              '3',
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
