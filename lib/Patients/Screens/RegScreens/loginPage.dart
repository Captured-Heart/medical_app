
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Patients/Screens/RegScreens/SignUp1.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';


class LoginPage extends StatefulWidget {
  static const String routes = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _globalScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  AnimationController ?controller;
  AnimationController ?controller2;
  Animation ?animation;

  FirebaseAuth _auth = FirebaseAuth.instance;
  // AuthMethods _authMethod = AuthMethods();
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), /*upperBound: 10*/
    );
    controller!.reverse(from: 1.0);

    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);

    controller!.addListener(() {
      // print(controller.value);
      setState(() {});
    });

//CONTROLLER 2 EFFECTS
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 470),
    );
    controller2!.forward();

    animation = CurvedAnimation(parent: controller2!, curve: Curves.bounceOut);

    controller2!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.value;
    controller2!.value;
    _emailController.dispose();
    _passwordController.dispose();
  }

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // void _showSnackBar(String error) {
  //   final _snackBar = SnackBar(
  //     content: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Icon(Icons.error, color: Colors.red),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: AutoSizeText(
  //             error,
  //             // maxLines: 2,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  //   _globalScaffoldKey.currentState.showSnackBar(_snackBar);
  // }

  bool showSpinner = false;

  void _toLogin() async {
    setState(() {
      showSpinner = true;
    });
    try {
      print(_emailController.text);
      print(_passwordController.text);

      final _user = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // if (_user.user.isEmailVerified) {
      //   Navigator.pushNamed(context, MainScreen.routes);
      //   setState(() {
      //     showSpinner = false;
      //   });
      // } else {
      //   _showSnackBar('Please Verify your Email before you can Login');
      // }
    } catch (e) {
      // _showSnackBar(e.message);
    }
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
       MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        routes: {
          // SignUp1.routes: (context) => SignUp1(),
          // SignUp2.routes: (context) => SignUp2(),
          // MainScreen.routes: (context) => MainScreen(),
        },
        home: SafeArea(
          child: Scaffold(
            key: _globalScaffoldKey,
            body: Container(
              height: size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             MapsHomePage(size: size)));
                        },
                        child: Container(
                          color: Colors.red,
                          width: double.infinity,
                          height: size.height * 0.07,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 12),
                                child: Image.asset('assets/images/marker.png'),
                              ),
                             Center(
                                    child: Text(
                                  'For Emergencies, Use Map!!!',
                                  style: TextStyle(
                                      fontSize: size.width * 0.058,
                                      fontWeight: FontWeight.w500),
                                )),
                            
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      Text('LOGIN',
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontSize: controller2!.value * size.width * 0.12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            height: size.height * 0.0025,
                            letterSpacing: 2,
                          )),

                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _loginFormKey,
                        child: Column(
                          children: <Widget>[
                            //EMAIL INPUT
                            FormInputEmail(
                              textAlign: TextAlign.left,
                              textInputType: TextInputType.emailAddress,
                              controller: _emailController,
                              focusNode: _emailFocus,
                              onfieldSubmit: (value) {
                                _fieldFocusChange(
                                    context, _emailFocus, _passwordFocus);
                              },
                              text: 'Email',
                              icon: Icons.email,
                              hintText: 'Enter your Email',
                              textInputAction: TextInputAction.next,
                              // validator: ,
                            ),
                            SizedBox(
                              height: size.height * 0.013,
                            ),

                            //PASSWORD INPUT
                            FormInputPassword(
                              textInputType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              onfieldSubmit: (value) {
                                _passwordFocus.unfocus();
                                setState(() {
                                  _toLogin();
                                });
                              },
                              validator: (){},
                              onChanged: (){},
                              onSaved: (){},
                              obscureText: true,
                              text: 'Password',
                              icon: Icons.lock,
                              textInputAction: TextInputAction.send,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ForgotPass()));
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 20, top: 15),
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),

                            SizedBox(height: size.height * 0.07),

                            //LOGIN BUTTON
                            !showSpinner
                                ? ApplyButton(
                                  size:size,
                                    text: 'Login',
                                    press: _toLogin,
                                    horizontal: size.width * 0.03,
                                    // () async {
                                    //   setState(() {
                                    //     showSpinner = true;
                                    //   });
                                    //   try {
                                    //     print(_emailController.text);
                                    //     print(_passwordController.text);

                                    //     final _user =
                                    //         await _auth.signInWithEmailAndPassword(
                                    //       email: _emailController.text,
                                    //       password: _passwordController.text,
                                    //     );
                                    //     if (_user.user.isEmailVerified) {
                                    //       Navigator.pushNamed(
                                    //           context, MainScreen.routes);
                                    //       setState(() {
                                    //         showSpinner = false;
                                    //       });
                                    //     } else {
                                    //       _showSnackBar(
                                    //           'Please Verify your Email before you can Login');
                                    //     }
                                    //   } catch (e) {
                                    //     _showSnackBar(e.message);
                                    //   }
                                    //   setState(() {
                                    //     showSpinner = false;
                                    //   });
                                    // },
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      width: size.width * 0.85,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blueGrey,
                                            offset: Offset(1.0, 10.0),
                                            blurRadius: 20.0,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Connecting',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                color: Color(0xff2DBDE4),
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            CircularProgressIndicator(
                                              strokeWidth: 5,
                                            )
                                          ],
                                        ),
                                   
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),

                      // SizedBox(
                      //     height: controller2.value * size.height * 0.08),

                      Spacer(flex: 7),

                      //ALREADY ONBOARD
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 10.0),
                      //   child: Already0nBoard(
                      //     login: false,
                      //     press: () {
                      //       setState(() {
                      //         // Navigator.pushReplacementNamed(
                      //         //     context, SignUp1.routes);
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //         builder: (context) => SignUp1()));
                      //       });
                      //     },
                      //   ),
                      // ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    
  }

  // _forgotPass() async {
  //   await _authMethod.resetPassword(_emailController.text);
  // }
}

