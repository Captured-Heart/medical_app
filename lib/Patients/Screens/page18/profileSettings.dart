import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/Patients/Screens/page18/specialistOffice.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';
import 'package:medical_app/firebase_Utils/database.dart';
import 'package:path/path.dart';


class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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

  // dynamic name;
  // dynamic email;
  // AuthMethods authMethods = AuthMethods();
  // Future<dynamic> getData(BuildContext context) async {
  //   final uid = await authMethods.getCurrentUID();

  //   final DocumentReference document = FirebaseFirestore.instance
  //       .collection('patients')
  //       .doc('patientsID')
  //       .collection('Profile')
  //       .doc();

  //   await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
  //     setState(() {
  //       name = snapshot['name'];
  //       email = snapshot['email'];
  //       // data = snapshot.docs.first;
  //       // print(docId);
  //     });
  //   });
  //   // docId = document.document().documentID;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData(context);
  //   print(name);
  // }
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  DataBaseService dataBaseService = DataBaseService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _langController = TextEditingController();
  TextEditingController _currentPassController = TextEditingController();
  TextEditingController _repeatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // resizeToAvoidBottomInset: false,
      // extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackIcon(),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: FutureBuilder(
                future: getProfile(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ChangePhotoColumn(
                        size: size,
                        pickImage: _pickImage,
                        imgFile: _imgFile,
                      ),
                      // InputColumn(size: size, changePassword: _changePassword),
                      InputColumn(
                        size: size,
                        changePassword: !_changePassword,
                        nameController: _nameController,
                        emailController: _emailController,
                        langController: _langController,
                        press: () {
                          setState(() {
                            _changePassword = !_changePassword;
                          });
                        },
                      ),
                      Container(
                        height: _changePassword ? size.height * 0.22 : 0,
                        child: Column(
                          children: [
                            FormInputPassword(
                              size: size,
                              text: 'Current password',
                              passwordController: _currentPassController,
                            ),
                            FormInputPassword(
                              passwordController: _repeatController,
                              size: size,
                              text: 'New password',
                            ),
                          ],
                        ),
                      ),
                      // Spacer(flex: _changePassword ? 4 : 3),
                      SizedBox(height:_changePassword ? 4 : size.height * 0.24),
                      ApplyButton(
                        size: size,
                        text: 'Save changes',
                        horizontal: 0.22,
                        press: () {
                          try {
                              // String fileName = basename(widget.emailController.text  + ' ${dateFormatted()}');
                            // StorageReference firebaseStorageRef =
                            //     FirebaseStorage.instance.ref().child('Profile_Pic').child(fileName);
                            // StorageUploadTask uploadTask =
                            //     firebaseStorageRef.putFile(_imgFile);
                            // StorageTaskSnapshot taskSnapshot =
                            //     await uploadTask.onComplete;
                            // final String downloadUrl =
                            //     await taskSnapshot.ref.getDownloadURL();
                            // dataBaseService.changePassword(
                            //     _currentPassController.text,
                            //     _repeatController.text);
                            // // <String, dynamic> profileMap
                            // if (_formKey1.currentState!.validate()){
                              
                            // }
                            // Map<String, String> userInfoMap = {
                            //   'docName': widget.docName!,
                            //   'date': widget.date!,
                            //   'time': widget.time!,
                            //   'docId': widget.docId!,
                            //   'imageUrl': widget.imageUrl!,
                            // };
                            // dataBaseService.setPatientsProfile(profileMap);
                          } catch (e) {}
                  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecialistOffice(),
                            ),
                          );
                        },
                      ),
                      // Spacer(flex: _changePassword ? 8 : 1),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

//TODO: CHANGE THE UUID TO CURRENTUID!!!!!!!!
  var db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getProfile() async => await db
      .collection('patients')
      .doc('patientsID')
      .collection('Profile')
      .get();
}

class InputColumn extends StatelessWidget {
  const InputColumn({
    Key? key,
    required this.size,
    required bool changePassword,
    this.press,
    this.nameController,
    this.emailController,
    this.langController,
  })  : _changePassword = changePassword,
        super(key: key);

  final Size size;
  final bool _changePassword;
  final press;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? langController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInputEmail(
          size: size,
          text: 'Name',
          controller: nameController,
        ),
        LanguageFormInput(
          size: size,
          text: 'Language',
          langController: langController,
        ),
        FormInputEmail(
          size: size,
          text: 'E-mail',
          controller: emailController,
        ),
        _changePassword ? ChangePassword(press: press) : Text('')
      ],
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
    required this.press,
  }) : super(key: key);

  final press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        'Change password',
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }
}

class LanguageFormInput extends StatefulWidget {
  const LanguageFormInput({
    Key? key,
    required this.size,
    required this.text,
    this.langController,
  }) : super(key: key);

  final Size size;
  final String text;
  final TextEditingController? langController;

  @override
  _LanguageFormInputState createState() => _LanguageFormInputState();
}

class _LanguageFormInputState extends State<LanguageFormInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: widget.size.height * 0.01),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Color(0xffA5A5A5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: widget.size.height * 0.04),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme.of(context).buttonColor,
              obscureText: _obscureText,
              controller: widget.langController,
              decoration: InputDecoration(
                suffixIconConstraints: BoxConstraints(),
                contentPadding: EdgeInsets.all(0),
                isDense: true,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).buttonColor,
                  size: 22,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ),
              autofocus: false,
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePhotoColumn extends StatelessWidget {
  final pickImage;

  final File? imgFile;

  const ChangePhotoColumn({
    Key? key,
    required this.size,
    this.pickImage,
    this.imgFile,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Image.asset(
          //   'assets/images/ivan.png',
          Container(
            height: size.height * 0.17,
            width: size.width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: imgFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      imgFile!,
                      // 'assets/images/peter.png',
                      fit: BoxFit.cover,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      right: 10,
                    ),
                    child: Image.asset(
                      'assets/images/avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          // ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: pickImage,
            child: Text(
              'Change the photo',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).buttonColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
