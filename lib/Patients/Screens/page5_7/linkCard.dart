import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page11-14/docProfileRegistered.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';

class LinkCardPage extends StatelessWidget {
  static const String routes = 'linkCardPage';
  final String? time, date, docId;

  LinkCardPage({
    Key? key,
    this.time,
    this.date,
    this.docId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.22,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(40),
                    bottomStart: Radius.circular(40),
                  ),
                ),
                child: FutureBuilder(
                    future: getData(context),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      if (snapshot.connectionState == ConnectionState.none)
                        return Center(
                          child: Icon(
                            Icons.error,
                            size: 100,
                          ),
                        );
                      return LinkCardHeader(
                        size: size,
                        name: snapshot.data!['name'],
                        date: date!,
                        time: time!,
                      );
                    }),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.04,
                ),
                child: Form(
                  child: Column(
                    children: [
                      FormInputEmail(
                        size: size,
                        text: 'E-mail',
                      ),
                      FormInputPassword(size: size, text: 'Password'),
                      FormInputPassword(
                          size: size, text: 'Repeat the Password'),
                      // SizedBox(height: size.height * 0.4,)
                      // Spacer(),
                      Container(
                        height: size.height * 0.17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VerticalDivider(
                              width: 1,
                              thickness: 2,
                              color: Theme.of(context).buttonColor,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: AutoSizeText(
                                  '''To validate an entry, we need to make sure that you will be able to pay for the lesson. To do this, we will write off from the card 1 ruble and we will immediately return it.

Without confirmation, the recording will be canceled after 40 minutes.''',
                                  style: TextStyle(
                                      color: Theme.of(context).canvasColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ApplyButton(
                        size: size,
                        text: 'Link card',
                        horizontal: 0.25,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegDocProfile(
                                docID: docId,
                                date: date,
                                time: time,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final db = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getData(BuildContext context) async {
    final document = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc(docId);
    return document.get();
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _goBack(context);
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 20.0,
      ),
    );
  }
}

class FormInputPassword extends StatefulWidget {
  const FormInputPassword({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  _FormInputPasswordState createState() => _FormInputPasswordState();
}

class _FormInputPasswordState extends State<FormInputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: widget.size.height * 0.01),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Color(0xffA5A5A5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: widget.size.height * 0.04),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Theme.of(context).buttonColor,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(),
              contentPadding: EdgeInsets.all(0),
              isDense: true,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: _obscureText
                      ? Theme.of(context).highlightColor
                      : Colors.blueGrey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
            autofocus: false,
          ),
        ),
      ],
    );
  }
}

class FormInputEmail extends StatelessWidget {
  const FormInputEmail({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);
  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.01),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xffA5A5A5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.04),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Theme.of(context).buttonColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LinkCardHeader extends StatelessWidget {
  const LinkCardHeader({
    Key? key,
    required this.size,
    required this.name,
    required this.date,
    required this.time,
  }) : super(key: key);

  final Size size;
  final String name, date, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          Text(
            'Your Specialist',
            style: TextStyle(
              color: Theme.of(context).buttonColor,
            ),
          ),
          SizedBox(height: size.height * 0.007),
          AutoSizeText(
            name
            // 'Ivanov Ivan Ivanovich'
            ,
            style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Reception will take place',
            style: TextStyle(
              color: Theme.of(context).buttonColor,
            ),
          ),
          SizedBox(height: size.height * 0.007),
          AutoSizeText(
            '$date, $time',
            style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),

            // style: TextStyle(color: Color(0xff3D3D3D)),
          ),
        ],
      ),
    );
  }
}
