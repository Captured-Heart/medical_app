import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Doctors/RegDoctor/loginDocEmail.dart';
import 'package:medical_app/RegPatient/loginPatients.dart';

class LoginPageDocEmail extends StatefulWidget {
  @override
  _LoginPageDocEmailState createState() => _LoginPageDocEmailState();
}

class _LoginPageDocEmailState extends State<LoginPageDocEmail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(flex: 2),
              Text(
                'Welcome to (app name), \n Doctor',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaceBookLoginButton(
                      size: size,
                      text: 'Log in through Facebook',
                      buttonColor: Color(0xff1877F2),
                      textColor: Theme.of(context).primaryColor,
                      icon: FontAwesomeIcons.facebook,
                      iconcolor: Theme.of(context).primaryColor,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginDocEmail()));
                      },
                    ),
                    FaceBookLoginButton(
                      size: size,
                      text: 'Log in through Vkontakte',
                      buttonColor: Color(0xff1877F2),
                      textColor: Theme.of(context).primaryColor,
                      icon: FontAwesomeIcons.medium,
                      iconcolor: Theme.of(context).primaryColor,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginDocEmail()));
                      },
                    ),
                    FaceBookLoginButton(
                      size: size,
                      text: 'Log in through Google',
                      buttonColor: Colors.grey.withOpacity(0.5),
                      textColor: Theme.of(context).highlightColor,
                      icon: FontAwesomeIcons.google,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginDocEmail()));
                      },
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPagePatients()));
                        },
                        leading: Container(
                          height: size.height * 0.1,
                          width: size.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.withOpacity(0.5)),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.stethoscope,
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                        title: Text('Go to patient version'))
                  ],
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

class FaceBookLoginButton extends StatelessWidget {
  final Color? buttonColor, textColor, iconcolor;
  final String text;
  final IconData? icon;

  const FaceBookLoginButton({
    Key? key,
    required this.size,
    required this.buttonColor,
    this.icon,
    required this.textColor,
    required this.text,
    this.iconcolor,
    this.press,
  }) : super(key: key);

  final Size size;
  final press;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor
            // Color(0xff1877F2),
            ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: size.width * 0.085,
            vertical: size.height * 0.025,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Container(
        width: size.width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: iconcolor,
              size: 30,
            ),
            AutoSizeText(
              text,
              style: TextStyle(color: textColor, fontSize: 18),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
