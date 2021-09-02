import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialistContainer extends StatefulWidget {
  const SpecialistContainer({
    Key? key,
  }) : super(key: key);

  @override
  _SpecialistContainerState createState() => _SpecialistContainerState();
}

class _SpecialistContainerState extends State<SpecialistContainer> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(40),
            bottomStart: Radius.circular(40),
          ),
        ),
        child: FutureBuilder(
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
              return Center(
                child: RichText(
                  text: TextSpan(
                    text: snapshot.data!.docs.length.toString(),
                    style: TextStyle(color: Theme.of(context).buttonColor),
                    children: [
                      TextSpan(
                        //TODO: set default TextColor acc to the mode(light or dark)

                        text: ' specialists ready to receive you',
                        style: buildTextStyleColor(context),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  TextStyle buildTextStyleColor(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).highlightColor,
      fontWeight: FontWeight.normal,
    );
  }
}

//!WIDGETS USED ABOVE

//!

//!

//!

//!
var db = FirebaseFirestore.instance;

Future<QuerySnapshot> getDoctorsStreams() async => await db
    .collection('doctors')
    .doc('doctorsID')
    .collection('Profiles')
    .get();

//

class AddPanicAttacksRowOptions extends StatefulWidget {
  final String ? option, option1, option2, option3, option4;
  const AddPanicAttacksRowOptions({
    Key? key,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.option,
  }) : super(key: key);

  @override
  _AddPanicAttacksRowOptionsState createState() =>
      _AddPanicAttacksRowOptionsState();
}

class _AddPanicAttacksRowOptionsState extends State<AddPanicAttacksRowOptions> {
  bool delWhatWorriesYouButton = true;
  bool delWhatWorriesYouButton1 = true;
  bool delWhatWorriesYouButton2 = true;
  bool delWhatWorriesYouButton3 = true;
  bool delWhatWorriesYouButton4 = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 15,
      runSpacing: 5,
      children: [
        SizedBox(width: 10),
        delWhatWorriesYouButton
            ? AddButton(
                text: widget.option!,
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton = !delWhatWorriesYouButton;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton1
            ? AddButton(
                text: widget.option1!,
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton1 = !delWhatWorriesYouButton1;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton2
            ? AddButton(
                text: widget.option2!,
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton2 = !delWhatWorriesYouButton2;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton3
            ? AddButton(
                text: widget.option3!,
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton3 = !delWhatWorriesYouButton3;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton4
            ? AddButton(
                text: widget.option4!,
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton4 = !delWhatWorriesYouButton4;
                  });
                },
              )
            : Text(''),
      ],
    );
  }
}

class AddPanicAttacksRowOptions2 extends StatefulWidget {
  const AddPanicAttacksRowOptions2({
    Key? key,
    
  }) : super(key: key);

  @override
  _AddPanicAttacksRowOptionsState2 createState() =>
      _AddPanicAttacksRowOptionsState2();
}

class _AddPanicAttacksRowOptionsState2
    extends State<AddPanicAttacksRowOptions2> {
  bool delWhatWorriesYouButton = false;
  bool delWhatWorriesYouButton1 = false;
  bool delWhatWorriesYouButton2 = false;
  bool delWhatWorriesYouButton3 = false;
  bool delWhatWorriesYouButton4 = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      // verticalDirection: VerticalDirection.up,
      spacing: 15,
      runSpacing: 5,
      children: [
        SizedBox(width: 10),
        !delWhatWorriesYouButton
            ? AddButton(
                text: 'stress',
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton = !delWhatWorriesYouButton;
                  });
                },
              )
            : Text(''),
        !delWhatWorriesYouButton1
            ? AddButton(
                text: 'Panic Attacks',
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton1 = !delWhatWorriesYouButton1;
                  });
                },
              )
            : Text(''),
        !delWhatWorriesYouButton2
            ? AddButton(
                text: 'Stress',
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton2 = !delWhatWorriesYouButton2;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton3
            ? AddButton(
                text: 'Sleep',
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton3 = !delWhatWorriesYouButton3;
                  });
                },
              )
            : Text(''),
        delWhatWorriesYouButton4
            ? AddButton(
                text: 'Depression',
                icon: FontAwesomeIcons.times,
                delWhatWorriesYou: () {
                  setState(() {
                    delWhatWorriesYouButton4 = !delWhatWorriesYouButton4;
                  });
                },
              )
            : Text(''),
      ],
    );
  }
}

//

class ManButton extends StatelessWidget {
  const ManButton({
    Key? key,
    this.bGcolor,
    required this.text,
    this.textColor,
  }) : super(key: key);
  final Color? bGcolor, textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10, bottom: 34),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        color: bGcolor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).accentColor, width: 0.2),
      ),
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final delWhatWorriesYou;

  const AddButton({
    Key? key,
    required this.text,
    this.textColor,
    this.icon,
    this.delWhatWorriesYou,
  }) : super(key: key);
  final Color? textColor;
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      // margin: EdgeInsets.only(top: 10, bottom: 34),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).accentColor, width: 0.12),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              width: size.width * 0.16,
              child: AutoSizeText(
                text,
                maxLines: 1,
                // textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor),
              ),
            ),
            GestureDetector(
              onTap: delWhatWorriesYou,
              child: Expanded(child: Icon(icon, size: 11)),
            )
          ],
        ),
      ),
    );
  }
}
