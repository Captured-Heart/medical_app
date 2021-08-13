import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/page1/topHeader.dart';
import 'package:medical_app/page15/chatPage.dart';
import 'package:medical_app/page18/profileSettings.dart';
import 'package:medical_app/themes/theme_switch.dart';

class PatientsProfile extends StatefulWidget {
  @override
  _PatientsProfileState createState() => _PatientsProfileState();
}

bool recordsExpand = false;
bool correspondenceExpand = false;
bool paymentExpand = false;

class _PatientsProfileState extends State<PatientsProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: ChangeThemeButtonWidget(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings()));
                  },
                  child: ProfPicAndName(
                    size: size,
                    imgString: 'assets/images/oleg.jpg',
                    name: 'Oleg',
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Divider(
                  thickness: 1,
                  // height: 50,
                ),

                //? RECORDS
                RecordsProfileOptions(
                  size: size,
                  title: 'Records',
                  icon: FontAwesomeIcons.list,
                  press: () {
                    setState(() {
                      recordsExpand = !recordsExpand;
                    });
                  },
                ),
                Container(
                  height: recordsExpand ? size.height * 0.076 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecordsSubSection(
                        size: size,
                        title: 'May 23, 17:00',
                        trailingWidget: Text('Specialist: Ivanov Ivan'),
                        leadingWidget: VerticalDivider(
                          thickness: 2,
                          color: Color(0xff58A4EB),
                        ),
                      ),
                      SizedBox(height: 8),
                      RecordsSubSection(
                        size: size,
                        title: 'May 24, 13:00',
                        trailingWidget: Text('Specialist: Ivanov Ivan'),
                        leadingWidget: VerticalDivider(
                          thickness: 2,
                          color: Color(0xff58A4EB),
                        ),
                      ),
                    ],
                  ),
                ),

                //?CORRESPONDENCE
                CorrespondenceProfileOptions(
                  size: size,
                  press: () {
                    setState(() {
                      correspondenceExpand = !correspondenceExpand;
                    });
                  },
                ),
                Container(
                  height: correspondenceExpand ? size.height * 0.12 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CorrespondenceSubSection(
                        size: size,
                        title: 'Ivanov Ivan',
                        trailingWidget: Text(
                          'Look',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        leadingWidget: Image.asset('assets/images/ivan.png'),
                      ),
                      SizedBox(height: 10),
                      CorrespondenceSubSection(
                        size: size,
                        title: 'Vetrov Peter',
                        trailingWidget: Text(
                          'Look',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        leadingWidget: Image.asset('assets/images/peter.png'),
                      ),
                    ],
                  ),
                ),

//?PAYMENT OPTIONS
                PaymentProfileOptions(
                  size: size,
                  press: () {
                    setState(() {
                      paymentExpand = !paymentExpand;
                    });
                  },
                ),
                Container(
                  height: paymentExpand ? size.height * 0.17 : 0,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.03,
                        ),
                        child: NumberSessionSumRow(),
                      ),

                      //?PAYMENT_OPTION_ROW
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.01,
                        ),
                        child: PaymentNumberSessionRow(
                          leading: '345365',
                          name: 'Ivanov Ivan',
                          date: 'May 21, 17:00',
                          sum: '2900₽',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.047,
                          right: size.width * 0.047,
                          top: size.height * 0.01,
                        ),
                        child: PaymentNumberSessionRow(
                          leading: '845365',
                          name: 'Ivanov Ivan',
                          date: 'May 19, 17:00',
                          sum: '2900₽',
                        ),
                      ),
                      // SizedBox(height: 10),
                    ],
                  ),
                ),

                Divider(
                  thickness: 1,
                  // height: 50,
                ),
                ProfileOptions(
                  text: 'personal information',
                  icon: FontAwesomeIcons.solidUser,
                  size: size,
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidUser,
                      color: Theme.of(context).highlightColor,
                      size: size.height * 0.027,
                    ),
                  ),
                ),
                ProfileOptions(
                  text: 'Rate app',
                  icon: FontAwesomeIcons.solidStar,
                  size: size,
                  leadingWidget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidStar,
                      color: Theme.of(context).highlightColor,
                      size: size.height * 0.027,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  // height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Center(
                    child: Text(
                      'Today\'s sessions',
                    ),
                  ),
                ),
                TodaySessionOption(
                  size: size,
                  title: 'Ivanov Ivan',
                  subtitle1: '17:00 | In',
                  subtitle2: ' 00:05',
                  subtitle2Color: Colors.green,
                  imageString: 'assets/images/ivan.png',
                  beginButton: ApplyButton(
                    size: size,
                    text: 'To begin',
                    horizontal: size.width * 0.0002,
                    press: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatPage()));
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: TodaySessionOption(
                    size: size,
                    title: 'Vetrov Peter',
                    subtitle1: '18:30 | In ',
                    subtitle2: ' 01:45',
                    subtitle2Color: Colors.blue,
                    imageString: 'assets/images/peter.png',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumberSessionSumRow extends StatelessWidget {
  const NumberSessionSumRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Number',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
        Spacer(),
        Text(
          'Session',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
        Spacer(flex: 4),
        Text(
          'Sum',
          style: TextStyle(color: Color(0xffA5A5A5)),
        ),
      ],
    );
  }
}

class ProfPicAndName extends StatelessWidget {
  const ProfPicAndName({
    Key? key,
    required this.size,
    required this.imgString,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String imgString, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgString,
              scale: 0.6,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

class PaymentNumberSessionRow extends StatelessWidget {
  final String leading, sum, name, date;

  const PaymentNumberSessionRow({
    Key? key,
    required this.leading,
    required this.sum,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leading,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // 'Ivanov Ivan',
              name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              date,
              // 'May 21, 17:00',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(flex: 4),
        Text(
          sum,
          // '2900₽',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class PaymentProfileOptions extends StatelessWidget {
  const PaymentProfileOptions({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: 'Payments',
        icon: FontAwesomeIcons.solidCommentDots,
        trailingIcon: paymentExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        // press: press,
        tileColor: paymentExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        leadingWidget: !paymentExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCreditCard,
                  size: 18,
                  color: paymentExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCreditCard,
                  size: 18,
                  color: paymentExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
        leadingIconColor:
            paymentExpand ? Colors.blue : Theme.of(context).highlightColor,
      ),
    );
  }
}

class CorrespondenceProfileOptions extends StatelessWidget {
  const CorrespondenceProfileOptions({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: 'Correspondence',
        icon: FontAwesomeIcons.solidCommentDots,
        trailingIcon: correspondenceExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        // press: press,
        tileColor: correspondenceExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        leadingWidget: !correspondenceExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCommentDots,
                  size: 18,
                  color: correspondenceExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCommentDots,
                  size: 18,
                  color: correspondenceExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
        leadingIconColor: correspondenceExpand
            ? Colors.blue
            : Theme.of(context).highlightColor,
      ),
    );
  }
}

class RecordsProfileOptions extends StatelessWidget {
  final String title;

  final IconData? icon;

  const RecordsProfileOptions({
    Key? key,
    required this.size,
    this.press,
    required this.title,
    this.icon,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ProfileOptions(
        size: size,
        text: title,
        trailingIcon: recordsExpand
            ? FontAwesomeIcons.angleUp
            : FontAwesomeIcons.angleDown,
        tileColor: recordsExpand
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        // press: press,
        leadingWidget: !recordsExpand
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: recordsExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Icon(
                  FontAwesomeIcons.list,
                  size: 18,
                  color: recordsExpand
                      ? Colors.blue
                      : Theme.of(context).highlightColor,
                ),
              ),
      ),
    );
  }
}

class RecordsSubSection extends StatelessWidget {
  final String title;
  final Widget trailingWidget, leadingWidget;

  const RecordsSubSection({
    Key? key,
    required this.size,
    required this.title,
    required this.trailingWidget,
    required this.leadingWidget,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.03,
      margin: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.1),
      child: Row(
        children: [leadingWidget, Expanded(child: Text(title)), trailingWidget],
      ),
    );
  }
}

class CorrespondenceSubSection extends StatelessWidget {
  final String title;
  final Widget trailingWidget, leadingWidget;

  const CorrespondenceSubSection({
    Key? key,
    required this.size,
    required this.title,
    required this.trailingWidget,
    required this.leadingWidget,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      margin: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.1),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12), child: leadingWidget),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          )),
          trailingWidget
        ],
      ),
    );
  }
}

class TodaySessionOption extends StatelessWidget {
  final String subtitle2, subtitle1, title, imageString;

  final Color subtitle2Color;

  final Widget? beginButton;

  const TodaySessionOption({
    Key? key,
    required this.size,
    required this.subtitle2,
    required this.subtitle1,
    required this.title,
    required this.subtitle2Color,
    required this.imageString,
    this.beginButton,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        // height: size.height * 0.092,
        child: ListTile(
          leading: ClipRRect(
            child: Image.asset(imageString),
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            // 'Ivanov Ivan',
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Theme.of(context).highlightColor,
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: subtitle1,
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                TextSpan(
                  text: subtitle2,
                  style: TextStyle(color: subtitle2Color),
                )
              ],
            ),
          ),

          // Text('17:00 | In 00:05'),
          trailing: beginButton,

          // tileColor: Colors.grey,
          dense: true,
          shape: Border.all(
            style: BorderStyle.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.018,
          ),
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  final String text;

  final IconData? icon;

  final IconData? trailingIcon;

  final press;

  final Color? leadingIconColor, tileColor;

  final Widget? leadingWidget;
  final Size size;
  const ProfileOptions({
    Key? key,
    required this.text,
    this.icon,
    this.trailingIcon,
    this.press,
    this.leadingIconColor,
    this.tileColor,
    this.leadingWidget,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      leading: leadingWidget,
      trailing: GestureDetector(
        onTap: press,
        child: Icon(
          trailingIcon,
          size: 22,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      dense: true,
    );
  }
}
