import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page5_7/worriesPage.dart';

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
        child: Center(
          child: RichText(
            text: TextSpan(
              text: '213',
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
        ));
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

class SleepProblemsRowOptions extends StatelessWidget {
  const SleepProblemsRowOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        AddButton(
          text: 'Sleep Problems',
          icon: FontAwesomeIcons.times,
        ),
        AddButton(
          text: 'Depression',
          icon: FontAwesomeIcons.times,
        ),
        AddButton(
          text: 'Violence',
          icon: FontAwesomeIcons.times,
        ),
      ],
    );
  }
}

class AddPanicAttacksRowOptions extends StatelessWidget {
  const AddPanicAttacksRowOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WorriesPage()));
          },
          child: AutoSizeText(
            'Add',
            style: TextStyle(color: Theme.of(context).buttonColor),
          ),
        ),
        AddButton(
          text: 'Panic attacks',
          icon: FontAwesomeIcons.times,
        ),
        AddButton(
          text: 'Stress',
          icon: FontAwesomeIcons.times,
        ),
      ],
    );
  }
}

class ManWomanRowOptions extends StatelessWidget {
  const ManWomanRowOptions({
    Key? key,
    required this.text,
    required this.text2,
    required this.text3,
  }) : super(key: key);
  final String text, text2, text3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ManButton(
          bGcolor: Theme.of(context).buttonColor,
          text: text,
          textColor: Theme.of(context).primaryColor,
        ),
        ManButton(
          bGcolor: Colors.transparent,
          text: text2,
        ),
        ManButton(
          bGcolor: Colors.transparent,
          text: text3,
        ),
      ],
    );
  }
}

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
  const AddButton({
    Key? key,
    required this.text,
    this.textColor,
    this.icon,
  }) : super(key: key);
  final Color? textColor;
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
            Icon(icon, size: 11)
          ],
        ),
      ),
    );
  }
}
