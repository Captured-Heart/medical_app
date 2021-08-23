import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:medical_app/Patients/Screens/RegScreens/SignUp1.dart';
import 'package:medical_app/Patients/Screens/page18/profileSettings.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/main.dart';


class SignUp2 extends StatefulWidget {
  static const String routes = 'signUp2';

  TextEditingController? nameController = TextEditingController();
  TextEditingController ?numberController = TextEditingController();
  TextEditingController ?addressController = TextEditingController();
  TextEditingController ?emailController = TextEditingController();

  SignUp2({
//   }
     this.nameController,
     this.emailController,
     this.numberController,
     this.addressController,
    // this.image
  });

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  // Forms forms = Forms();
  // final _auth = FirebaseAuth.instance;
  // AuthMethods _authMethod = AuthMethods();
  // DataBaseService dataBaseService = DataBaseService();

  String? _password;
  final format = DateFormat("yyyy-MM-dd");
  final _globalScaffoldKey2 = GlobalKey<ScaffoldState>();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _selectedGender = TextEditingController();

  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

//CHECHBOX REQUIREMENTS
  bool _agreeTOTS = true;

  // void _setAgreeTOTS(bool newValue) {
  //   setState(() {
  //     _agreeTOTS = newValue;
  //   });
  // }

  // bool _submittable() {
  //   return _agreeTOTS;
  // }

  bool showSpinner = false;

  // void _showSnackBar(String error) {
  //   final _snackBar = SnackBar(
  //     content: AutoSizeText(
  //       error,
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  //   _globalScaffoldKey2.currentState.showSnackBar(_snackBar);
  // }

  File? _imgFile;
  final picker = ImagePicker();

  Future _pickImage() async {
    final selected = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
        maxHeight: 400,
        preferredCameraDevice: CameraDevice.front);

    setState(() {
      if (selected != null) {
        _imgFile = File(selected.path);
        print(_imgFile!.lengthSync());
      } else {
        print('No image selected.');
      }
    });
  }

  // Future _cropImage() async {
  //   File cropped = await ImageCropper.cropImage(
  //       sourcePath: _imgFile.path,
  //       androidUiSettings: AndroidUiSettings(
  //           toolbarColor: Colors.blue[300],
  //           backgroundColor: Colors.teal[100],
  //           statusBarColor: Colors.black26));
  //   setState(() {
  //     _imgFile = cropped;
  //   });
  // }

  bool imageOptions = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          key: _globalScaffoldKey2,
          body: Container(
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // Align(
                  //   alignment: FractionalOffset.topLeft,
                  //   child: PrevButton(
                  //     size: size,
                  //     press: () {
                  //       print(_selectedGender.text);
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: _pickImage,
                    child: ChangePhotoColumn(
                      size: size,
                      imgFile: _imgFile,
                      pickImage: _pickImage,
                    ),
                  ),
                  Text('SIGN UP',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w500,
                        height: size.height * 0.002,
                      )),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Padding(
                        //   padding: EdgeInsets.all(size.width * 0.03),
                        //   child: DropDownButton(
                        //     size: size,
                        //     press: (newValue) {
                        //       setState(() {
                        //         _selectedGender.text = newValue;
                        //       });
                        //     },
                        //   ),
                        // ),

                        // DateofBirth(
                        //   size: size,
                        //   format: format,
                        //   controller: _dobController,
                        // ),

                        //PASSWORD
                        FormInputPassword(
                          textInputAction: TextInputAction.next,
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          onfieldSubmit: (value) {
                            _fieldFocusChange(
                                context, _passwordFocus, _confirmFocus);
                          },
                          onSaved: () {},
                          // key: _k3,
                          text: 'Password',
                          icon: Icons.lock,
                          hintText: 'Enter your Password',
                          onChanged: (value) => _password = value,
                          validator:(){}
                          //  MultiValidator(
                          //   [
                          //     RequiredValidator(
                          //         errorText: 'please enter a password'),
                          //     PatternValidator(
                          //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])',
                          //         errorText:
                          //             'at least 1 UpperCase, 1 lowerCase, 1 digit'),
                          //     MinLengthValidator(8,
                          //         errorText: 'Must be more than 8'),
                          //   ],
                          // ),
                        ),

                        //CONFIRM PASSWORD
                        FormInputPassword(
                            textInputAction: TextInputAction.send,
                            controller: _confirmController,
                            focusNode: _confirmFocus,
                            onfieldSubmit: (value) {
                              _confirmFocus.unfocus();
                            },
                            onChanged: (){},
                            onSaved: (){},
                            text: 'Confirm Password',
                            icon: FontAwesomeIcons.userLock,
                            hintText: 'Confirm PassWord',
                            validator: (value) {
                              if (value.isEmpty) return '*required';
                              if (value != _password) return 'does Not Match';
                              return null;
                            }),

                        Row(
                          children: [
                            // Checkbox(
                            //   value: _agreeTOTS,
                            //   onChanged: _setAgreeTOTS,
                            // ),
                            GestureDetector(
                              onTap: () {
                                // _setAgreeTOTS(!_agreeTOTS);
                                print(_agreeTOTS);
                              },
                              child: RichText(
                                text: TextSpan(
                                    text: 'I agree to the',
                                    style: TextStyle(
                                      color: _agreeTOTS
                                          ? Colors.blueGrey
                                          : Colors.red,
                                      fontSize: size.width * 0.05,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: ' terms & conditions',
                                          style: TextStyle(
                                              color: _agreeTOTS
                                                  ? Colors.pink
                                                  : Colors.blueGrey)
                                          //TODO2: Add a dialog that shows our company Terms and conditions
                                          // recognizer: TapGestureRecognizer()..onTap = press
                                          ),
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),

                  //TODO2: ADD ROUTE TO THIS BUTTON
                  ApplyButton(
                    size: size,
                    horizontal: 0.33,
                    text: 'Sign Up',
                    press: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                    }
                    // () async {
                    //   print(widget.addressController!.text);

                    //   setState(() {
                    //     showSpinner = true;
                    //   });

                    //   try {
                    //     print(_passwordController.text);
                    //     print(widget.emailController!.text);
                    //     // final form = _formKey1.currentState;

                    //     String fileName = basename(widget.emailController.text +
                    //         ' ${dateFormatted()}');
                    //     StorageReference firebaseStorageRef = FirebaseStorage
                    //         .instance
                    //         .ref()
                    //         .child('Profile_Pic')
                    //         .child(fileName);
                    //     StorageUploadTask uploadTask =
                    //         firebaseStorageRef.putFile(_imgFile);
                    //     StorageTaskSnapshot taskSnapshot =
                    //         await uploadTask.onComplete;
                    //     final String downloadUrl =
                    //         await taskSnapshot.ref.getDownloadURL();

                    //     if (form.validate()) {
                    //       _submittable();
                    //       print(fileName);
                    //       form.save();

                    //       await _authMethod.signUpWithEmailAndPassword(
                    //           widget.emailController.text,
                    //           _passwordController.text);
                    //       // uploadPic(context);

                    //       Map<String, String> userInfoMap = {
                    //         'name': widget.nameController.text,
                    //         'email': widget.emailController.text,
                    //         'phone': widget.numberController.text,
                    //         'address': widget.addressController.text,
                    //         'gender': _selectedGender.text,
                    //         'dob': _dobController.text,
                    //         'url': downloadUrl,
                    //         // 'uid': uid
                    //       };

                    //       // dataBaseService.setUserDetails(userInfoMap);

                    //       // showTopSnackBar(
                    //       //   context,
                    //       //   CustomSnackBar.success(
                    //       //     message:
                    //       //         "Congratulations, your registration was successful, Please Verify Your Email!!",
                    //       //     backgroundColor: Colors.teal[300],
                    //       //   ),
                    //       // );
                    //       // if (_imgFile == null) {
                    //       //   _showSnackBar('Please Provide a Profile Picture');
                    //       // } else {
                    //       //   Navigator.of(context).pushNamedAndRemoveUntil(
                    //       //       LoginPage.routes,
                    //       //       (Route<dynamic> route) => false);
                    //       // }
                    //       setState(() {
                    //         showSpinner = false;
                    //       });
                    //     }
                    //   } catch (e) {
                    //     _showSnackBar(e.toString());

                    //     setState(
                    //       () {
                    //         showSpinner = false;
                    //       },
                    //     );
                    //     print(e);
                    //   }
                    // },
                  ),
                  //TODO1: ADD NAVIGATION TO LOGIN PAGE
                  // SizedBox(height: size.height * 0.05),
                  // Padding(
                  //   padding: const EdgeInsets.all(18.0),
                  //   child: Already0nBoard(
                  //     login: true,
                  //     press: () {
                  //       Navigator.of(context).pushNamedAndRemoveUntil(
                  //           LoginPage.routes,
                  //           (Route<dynamic> route) => false);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
