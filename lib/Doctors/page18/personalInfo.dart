import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Screens/page5_7/worriesPage.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/page1-4_Widgets/topHeader.dart';
import 'package:medical_app/firebase_Utils/database.dart';
import 'package:path/path.dart' as path;
import 'profileSettings.dart';

class PersonalInformationPage extends StatefulWidget {
  final String docId;

  const PersonalInformationPage({Key? key, required this.docId})
      : super(key: key);
  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  bool changePassword = true;
  final ImagePicker picker = ImagePicker();
  File? _imgFile;
  DataBaseService dataBaseService = DataBaseService();

  Future _pickImage() async {
    final selected = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
      maxHeight: 400,
      preferredCameraDevice: CameraDevice.front,
    );

    setState(() {
      if (selected != null) {
        _imgFile = File(selected.path);
        print(_imgFile!.lengthSync());
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _langController = TextEditingController();
  TextEditingController _eduController = TextEditingController();
  TextEditingController _yearsPassController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _currentPassController = TextEditingController();
  TextEditingController _repeatPassController = TextEditingController();
  TextEditingController _specController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();

  Future _upload() async {
    try {
      String fileName = path.basename(_nameController.text);

      Reference firebaseStorage = FirebaseStorage.instance
          .ref()
          .child('Doc_ProfilePic')
          .child(fileName);
      UploadTask uploadTask = firebaseStorage.putFile(_imgFile!);
      TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => firebaseStorage.getDownloadURL());
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      Map<String, dynamic> docProfileMap = {
        'about': _aboutController.text,
        'edu': [
          _eduController.text,
          _eduController.text,
          _eduController.text,
        ],
        'imageUrl': downloadUrl,
        'name': _nameController.text,
        'surname': _surnameController.text,
        'language': _langController.text,
        'occupation': _occupationController.text,
        'rating': '4',
        'salary': _salaryController.text,
        'spec': [
          _specController.text,
          _specController.text,
          _specController.text
        ],
        'time': '12:30',
        'years': _yearsPassController.text,
        'email': _emailController.text
      };
      dataBaseService.updateDoctorsDetails(docProfileMap, widget.docId);
      dataBaseService.updateAllDoctorsDetails(docProfileMap, widget.docId);
      // dataBaseService.setDocProfile(docProfileMap);
      // dataBaseService.setAllDocProfile(docProfileMap);
      Navigator.pop(context);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChangePhotoColumn(
                size: size,
                pickImage: _pickImage,
                imgFile: _imgFile,
              ),
              FormInputEmail(
                size: size,
                text: 'Name',
                controller: _nameController,
              ),
              FormInputEmail(
                size: size,
                text: 'Surname',
                controller: _surnameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: LanguageFormInput(
                      size: size,
                      text: 'Language',
                      langController: _langController,
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
                  size: size, text: 'Education', controller: _eduController),
              FormInputEmail(
                size: size,
                text: 'Occupation',
                controller: _occupationController,
              ),
              FormInputEmail(
                size: size,
                text: 'Salary',
                controller: _salaryController,
              ),
              FormInputEmail(
                size: size,
                text: 'Years of Experience',
                controller: _yearsPassController,
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
                      controller: _aboutController,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: LanguageFormInput(
                      size: size,
                      text: 'Specialization',
                      langController: _specController,
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.add_box_rounded, size: 32),
                ],
              ),
              DepressionAcceptingRow(size: size),
              SizedBox(height: size.height * 0.03),
              FormInputEmail(
                size: size,
                text: 'E-mail',
                controller: _emailController,
              ),
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
                      text: 'Current password',
                    ),
                    FormInputPassword(
                      size: size,
                      text: 'New password',
                    ),
                  ],
                ),
              ),
              Center(
                  child: ApplyButton(
                size: size,
                text: 'Save changes',
                horizontal: 0.2,
                press: _upload,
              )),
              SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  final int? maxLength, minLength;

  final TextEditingController? controller;

  const CommentBox({
    Key? key,
    this.maxLength,
    this.minLength,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: null,
        // expands: true,
        controller: controller,
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
