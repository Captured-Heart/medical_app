import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Patients/Screens/RegScreens/signUp2.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';

import 'loginPage.dart';

class SignUp1 extends StatefulWidget {
  static const String routes = 'signUp1';
  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> with TickerProviderStateMixin {
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
// Controllers controllers = Controllers();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController = ScrollController()
  //     ..addListener(() {
  //       setDialVisible(scrollController.position.userScrollDirection ==
  //           ScrollDirection.forward);
  //     });
  // }
  void _toSignUp2() {
    print(_nameController.text);
    print(_emailController.text);
    print(_numberController.text);
    print(_addressController.text);

    final form = _formKey1.currentState;
    if (form!.validate()) {
      form.save();

      // return Navigator.pushNamed(context, SignUp2.routes);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUp2(
            emailController: _emailController,
            nameController: _nameController,
            numberController: _numberController,
            addressController: _addressController,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signUp2': (context) => SignUp2(),
        '/login': (context) => LoginPage(),
      },
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w500,
                      height: size.height * 0.002,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Form(
                    key: _formKey1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FormInputEmail(
                          textAlign: TextAlign.left,
                          controller: _nameController,
                          focusNode: _nameFocus,
                          onfieldSubmit: (value) {
                            _fieldFocusChange(context, _nameFocus, _emailFocus);
                          },
                          textInputAction: TextInputAction.next,
                          text: 'Full name(Surname first)',
                          icon: FontAwesomeIcons.userAlt,
                          // hintText: 'Enter your username',
                          textInputType: TextInputType.text,
                          validator: (){}
                          // MultiValidator([
                          //   RequiredValidator(errorText: '*Required'),
                          //   MinLengthValidator(5,
                          //       errorText: 'not less than 5 characters')
                          // ]),
                        ),
                        FormInputEmail(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          onfieldSubmit: (value) {
                            _fieldFocusChange(
                                context, _emailFocus, _numberFocus);
                          },
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.next,
                          text: 'Email',
                          icon: Icons.email,
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress,
                          // validator: MultiValidator([
                          //   RequiredValidator(errorText: 'Email is required'),
                          //   PatternValidator(
                          //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                          //       errorText: 'Valid Email is required')
                          // ]),
                        ),
                        FormInputEmail(
                          controller: _numberController,
                          focusNode: _numberFocus,
                          onfieldSubmit: (value) {
                            _fieldFocusChange(
                                context, _numberFocus, _addressFocus);
                          },
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          text: 'Phone Number',
                          icon: Icons.phone,
                          hintText: 'Enter your Number ',
                          validator: (){}
                          // MultiValidator(
                          //   [
                          //     RequiredValidator(errorText: '*required'),
                          //     PatternValidator(r'^[0-9\-\+]{9,15}$',
                          //         errorText: 'Insert a valid number'),
                          //   ],
                          // ),
                        ),
                        FormInputEmail(
                          controller: _addressController,
                          focusNode: _addressFocus,
                          onfieldSubmit: (value) {
                            _addressFocus.unfocus();
                            setState(() {
                              _toSignUp2();
                            });
                          },
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.go,
                          text: 'Residential Address',
                          icon: FontAwesomeIcons.addressBook,
                          hintText: 'Enter your Address',
                          textInputType: TextInputType.text,
                          maxlength: 105,
                          validator:(){}
                          
                          //  MultiValidator([
                          //   RequiredValidator(
                          //       errorText: 'field must not be empty'),
                          //   MaxLengthValidator(105,
                          //       errorText: 'Not more than 255 words'),
                          // ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.023),

                  ApplyButton(
                    size: size,
                    text: 'Next',
                    press: _toSignUp2,
                    horizontal: 0.03,
                  ),

                  SizedBox(height: size.height * 0.045),
                  // Spacer(),
                  // Padding(
                  //   padding: EdgeInsets.all(12.0),
                  //   child: Already0nBoard(
                  //     press: () {
                  //       Navigator.pushReplacementNamed(
                  //           context, LoginPage.routes);
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

  // void setDialVisible(bool value) {
  //   setState(() {
  //     dialVisible = value;
  //   });
  // }
}

class FormInputEmail extends StatelessWidget {
  final String? text, hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function? validator;
  final int? maxlength;
  final Function? onChanged, onSaved;
  final TextInputAction? textInputAction;
  final focus = FocusNode();
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function? onfieldSubmit;
  final Color? fillColor;
  final TextAlign? textAlign;
  FormInputEmail(
      {Key? key,
      this.text,
      this.icon,
      this.hintText,
      this.textInputType,
      this.obscureText = false,
      this.validator,
      this.maxlength,
      this.onChanged,
      this.textAlign,
      this.textInputAction,
      @required this.controller,
      this.focusNode,
      this.onfieldSubmit,
      this.onSaved,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.006),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              text!,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.045,
              ),
            ),
          ),
          TextFormField(
            textAlign: textAlign!,
            controller: controller,
            textInputAction: textInputAction,
            maxLength: maxlength,
            keyboardType: textInputType,
            obscureText: obscureText!,
            validator: validator!(),
            onChanged: onChanged!(),
            onSaved: onSaved!(),
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.blueGrey,
                size: size.width * 0.06,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: fillColor,
              filled: true,
            ),
            autofocus: false,
            onFieldSubmitted: onfieldSubmit!(),
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}

class FormInputPassword extends StatefulWidget {
  final String? text, hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function validator;
  final int? maxlength;
  final Function onChanged, onSaved;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function? onfieldSubmit;
  FormInputPassword(
      {Key? key,
      this.text,
      this.icon,
      this.hintText,
      this.textInputType,
      this.obscureText = false,
      required this.validator,
      this.maxlength,
      required this.onChanged,
      this.textInputAction,
      @required this.controller,
      this.focusNode,
      this.onfieldSubmit,
      required this.onSaved});

  @override
  _FormInputPasswordState createState() => _FormInputPasswordState();
}

class _FormInputPasswordState extends State<FormInputPassword> {
  final focus = FocusNode();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              widget.text!,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.045,
              ),
            ),
          ),
          TextFormField(
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxlength,
            keyboardType: widget.textInputType,
            obscureText: _obscureText,
            validator: widget.validator(),
            onChanged: widget.onChanged(),
            onSaved: widget.onSaved(),
            style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
                color: Colors.blueGrey,
                size: size.width * 0.06,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: _obscureText ? Colors.black87 : Colors.blueGrey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            autofocus: false,
            onFieldSubmitted: widget.onfieldSubmit!(),
            focusNode: widget.focusNode,
          ),
        ],
      ),
    );
  }
}
