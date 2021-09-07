import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Doctors/RegDoctor/patSignUp.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/firebase_Utils/database.dart';
import 'package:medical_app/firebase_Utils/users.dart';
import 'package:medical_app/main.dart';

class LoginPatientEmail extends StatefulWidget {
  @override
  _LoginPatientEmailState createState() => _LoginPatientEmailState();
}

class _LoginPatientEmailState extends State<LoginPatientEmail> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  // AuthMethods _auth = AuthMethods();
  DataBaseService dataBaseService = DataBaseService();
  FirebaseAuth _auth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var passController = TextEditingController();

  var signUpEmailController = TextEditingController();
  var signUpPassController = TextEditingController();

  void _toLogin() async {
    try {
      print(emailController.text);
      print(passController.text);

      final _user = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      if (_user.user!.emailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatSignUp(email: emailController.text),
        ));
      } else {
        print('no sign in');
        // _showSnackBar('Please Verify your Email before you can Login');
      }
    } catch (e) {
      print('errrrrroooooorrrr');
    }
  }

//? create account
  void createAcc() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPassController.text,
      );
      User? firebaseUser = userCredential.user;

      Users(userId: userCredential.user!.uid);
      // dataBaseService.setPatientsProfile(profileMap);
      // dataBaseService.setPatientsAppointment(appointmentMap);
      // dataBaseService.setPatientsFavourites(favouritesMap);
      // dataBaseService.setPatientsChat(chatMap);
      // dataBaseService.setPatientsPayment(paymentMap);
      // dataBaseService.setPatientsRecords(recordMap);

      await firebaseUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: signUpEmailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_moderator_outlined,
                              color: Colors.blueGrey,
                              size: size.width * 0.06,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          autofocus: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, top: 5),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: signUpPassController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_moderator_outlined,
                              color: Colors.blueGrey,
                              size: size.width * 0.06,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          autofocus: false,
                        ),
                      ),
                      // SizedBox(height: 80),
                      ApplyButton(
                        size: size,
                        text: 'Sign Up',
                        horizontal: 0.3,
                        press: createAcc,
                      ),
                      Text(
                        'please this is a test, after signing up, verify your email so you can sign in below!!',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.start,
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_moderator_outlined,
                              color: Colors.blueGrey,
                              size: size.width * 0.06,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          autofocus: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, top: 5),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: passController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_moderator_outlined,
                              color: Colors.blueGrey,
                              size: size.width * 0.06,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          autofocus: false,
                        ),
                      ),
                      // SizedBox(height: 80),
                      ApplyButton(
                        size: size,
                        text: 'Complete Sign up',
                        horizontal: 0.3,
                        press: _toLogin,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
