import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/page1/topHeader.dart';
import 'package:medical_app/Patients/Screens/worriesPage.dart';
import 'package:medical_app/page18/profileSettings.dart';
import 'package:medical_app/page7/linkCard.dart';

class PersonalInformationPage extends StatefulWidget {
  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  bool changePassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1.53,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChangePhotoColumn(size: size),
              FormInputEmail(
                size: size,
                text: 'Name',
              ),
              FormInputEmail(
                size: size,
                text: 'Surname',
              ),
              Row(
                children: [
                  Expanded(
                    child: LanguageFormInput(
                      size: size,
                      text: 'Language',
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.add_box_rounded, size: 32),
                ],
              ),
              Row(
                children: [
                  AddButton(
                    text: 'PycckNN',
                    icon: FontAwesomeIcons.times,
                  ),
                  SizedBox(width: 30),
                  AddButton(
                    text: 'English',
                    icon: FontAwesomeIcons.times,
                  ),
                ],
              ),
              SizedBox(height: 15),
              FormInputEmail(
                size: size,
                text: 'Education',
              ),
              FormInputEmail(
                size: size,
                text: 'Years of Experience',
              ),
              Container(
                height: size.height * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Myself'),
                    SizedBox(height: 10),
                    CommentBox(
                      maxLength: 600,
                      minLength: 7,
                    ),
                  ],
                ),
              ),
              FormInputEmail(size: size, text: 'Specialization'),
              DepressionAcceptingRow(size: size),
              SizedBox(height: size.height * 0.03),
              FormInputEmail(size: size, text: 'E-mail'),
              changePassword
                  ? ChangePassword(press: () {
                      setState(() {
                        changePassword = !changePassword;
                      });
                    })
                  : ChangePassword(press: () {
                      setState(() {
                        changePassword = !changePassword;
                      });
                    }),
              SizedBox(height: size.height * 0.02),
              Container(
                height: !changePassword ? size.height * 0.22 : 0,
                child: Column(
                  children: [
                    FormInputPassword(
                      size: size,
                      text: 'New password',
                    ),
                    FormInputPassword(
                      size: size,
                      text: 'Repeat new password',
                    ),
                  ],
                ),
              ),
              Center(
                  child: ApplyButton(
                      size: size, text: 'Save changes', horizontal: 0.2)),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  final int? maxLength, minLength;

  const CommentBox({
    Key? key,
    this.maxLength,
    this.minLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: null,
        // expands: true,
        maxLength: maxLength,
        minLines: minLength,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          focusColor: Theme.of(context).buttonColor,
          hoverColor: Theme.of(context).buttonColor,
          filled: true,
          hintText: 'Text....',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ));
  }
}
