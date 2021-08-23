import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/firebase_Utils/authMethods.dart';

class DataBaseService {
  final String? uid;
  final String? nameController;
  final String? emailController;
  final String? numberController;
  final String? addressController;
  final String? genderController;
  final String? dobController;

  DataBaseService(
      {this.nameController,
      this.emailController,
      this.numberController,
      this.addressController,
      this.genderController,
      this.dobController,
      this.uid});
  AuthMethods authMethods = AuthMethods();

  final CollectionReference userSchedule =
      FirebaseFirestore.instance.collection('Schedule');

      //  final CollectionReference doctorsUsers =
      // FirebaseFirestore.instance.collection('doctors');

//! CREATE DATABASE FOR DOCTORS DETAILS/PROFILE
  Future setDoctorDetails(userMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uuid)
        .collection('Profile')
        .doc();
    return await userDetails.set(userMap);
  }

  //! CREATE PATIENTS DETAILS/PROFILE
  Future setPatientDetails(userMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Profile')
        .doc();
    return await userDetails.set(userMap);
  }

//! CREATE UPDATE FOR DOCTORS DETAILS
  Future updateDoctorsDetails(userMap, String path) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uuid)
        .collection('Profile')
        .doc(path);
    return await userDetails.update(userMap);
  }

//! CREATE UPDATE FOR PATIENTS DETAILS
  Future updateUserDetails(userMap, String path) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Profile')
        .doc(path);
    return await userDetails.update(userMap);
  }

  Future setDocDetails(userMap, String docPath, String randomName) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('Folders')
        .doc(docPath)
        .collection('Files')
        .doc(randomName);

    return await userDetails.set(userMap);
  }

//CREATE DATABASE FOR SCHEDULE
  Future updateUserSchedule(scheduleMap) async {
    return await userSchedule.add(scheduleMap);
  }

//TRYING TO RETURN SAVED SCHEDULE FILES FROM DATABASE
  Future returnScheduleDetails(sMap) async {
    return await userSchedule.get();
  }
}
