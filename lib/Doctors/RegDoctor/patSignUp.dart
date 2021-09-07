import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/Doctors/page18/profileSettings.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/firebase_Utils/database.dart';
import 'package:medical_app/main.dart';
import 'package:path/path.dart' as path;

class PatSignUp extends StatefulWidget {
  final String email;
  const PatSignUp({Key? key, required this.email}) : super(key: key);

  @override
  _PatSignUpState createState() => _PatSignUpState();
}

class _PatSignUpState extends State<PatSignUp> {
  bool _changePassword = false;

  File? _imgFile;

  final ImagePicker picker = ImagePicker();

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

  DataBaseService dataBaseService = DataBaseService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _langController = TextEditingController();

  TextEditingController _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _emailController =
        TextEditingController(text: widget.email);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // resizeToAvoidBottomInset: false,
      // extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackIcon(),
        // title:
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 35,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'please fill this form(INCLUDING PIC) the first time, you can skip after first login',
                  style: TextStyle(color: Colors.red, fontSize: 22),
                ),
                ChangePhotoColumn(
                  size: size,
                  pickImage: _pickImage,
                  imgFile: _imgFile,
                ),
                // InputColumn(size: size, changePassword: _changePassword),
                SizedBox(height: 15),
                FormInputEmail(
                  size: size,
                  text: 'Surname',
                  controller: _surnameController,
                ),
                InputColumn(
                  size: size,
                  changePassword: !_changePassword,
                  nameController: _nameController,
                  emailController: _emailController,
                  langController: _langController,
                  // press: () {
                  //   setState(() {
                  //     _changePassword = !_changePassword;
                  //   });
                  // },
                ),
                // Container(
                //   height: _changePassword ? size.height * 0.22 : 0,
                //   child: Column(
                //     children: [
                //       FormInputPassword(
                //         size: size,
                //         text: 'Current password',
                //         passwordController: _currentPassController,
                //       ),
                //       FormInputPassword(
                //         passwordController: _repeatController,
                //         size: size,
                //         text: 'New password',
                //       ),
                //     ],
                //   ),
                // ),
                // Spacer(flex: _changePassword ? 4 : 3),
                // SizedBox(height: _changePassword ? 4 : size.height * 0.24),
                SizedBox(height: 30),
                ApplyButton(
                  size: size,
                  text: 'Complete Sign Up',
                  horizontal: 0.22,
                  press: () async {
                    try {
                      String fileName = path.basename(_nameController.text);
                      Reference firebaseStorage = FirebaseStorage.instance
                          .ref()
                          .child('Patient_ProfilePic')
                          .child(fileName);
                      UploadTask uploadTask =
                          firebaseStorage.putFile(_imgFile!);
                      TaskSnapshot taskSnapshot = await uploadTask
                          .whenComplete(() => firebaseStorage.getDownloadURL());
                      final String downloadUrl =
                          await taskSnapshot.ref.getDownloadURL();

                      Map<String, dynamic> patProfileMap = {
                        'name': _nameController.text,
                        'surname': _surnameController.text,
                        'language': _langController.text,
                        'email': _emailController.text,
                        'imageUrl': downloadUrl
                      };
                      dataBaseService.setPatientsProfile(patProfileMap);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } catch (e) {}
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),
                // Spacer(flex: _changePassword ? 8 : 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
