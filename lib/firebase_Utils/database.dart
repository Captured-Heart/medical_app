import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // final CollectionReference userSchedule =
  //     FirebaseFirestore.instance.collection('Schedule');

//! CREATE DATABASE FOR PATIENTS APPOINTMENT
  Future setPatientsAppointment(appointmentMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Appointments')
        .doc();
    return await userDetails.set(appointmentMap);
  }

//! CREATE DATABASE FOR PATIENTS CHAT
  Future setPatientsChat(chatMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Chat')
        .doc();
    return await userDetails.set(chatMap);
  }

  //! CREATE DATABASE FOR PATIENTS PAYMENT
  Future setPatientsPayment(paymentMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Payments')
        .doc();
    return await userDetails.set(paymentMap);
  }

//! CREATE DATABASE FOR PATIENTS PROFILE
  Future setPatientsProfile(profileMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Profile')
        .doc();
    return await userDetails.set(profileMap);
  }

  //! CREATE DATABASE FOR PATIENTS PROFILE
  Future setPatientsRecords(recordMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('Records')
        .doc();
    return await userDetails.set(recordMap);
  }

  Future setPatientsFavourites(favouritesMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('patients')
        .doc(uuid)
        .collection('favourites')
        .doc();
    return await userDetails.set(favouritesMap);
  }

  Future changePassword(String currentPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);
        
    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
      }).catchError((error) {
        //Error, show something
      });
    }).catchError((err) {});
// user.reauthenticateWithCredential(cred).then((value) {}).catchError(onError)
  }
//?PATIENTS ENDS ABOVE

  //! CREATE ALL DOCTORS PROFILE
  Future setAllDocProfile(docProfileMap) async {
    // final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc('doctorsID')
        .collection('Profiles')
        .doc();
    return await userDetails.set(docProfileMap);
  }

  //! CREATE INDIVIDUAL DOCTOR PROFILE
  Future setDocProfile(docProfileMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uuid)
        .collection('Profile')
        .doc();
    return await userDetails.set(docProfileMap);
  }

  //! CREATE INDIVIDUAL DOCTOR CHAT
  Future setDocChat(docChatMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uuid)
        .collection('Chat')
        .doc();
    return await userDetails.set(docChatMap);
  }

  //! CREATE INDIVIDUAL DOCTOR CHAT
  Future setDocReviews(docChatMap) async {
    final uuid = await authMethods.getCurrentUID();
    final DocumentReference userDetails = FirebaseFirestore.instance
        .collection('doctors')
        .doc(uuid)
        .collection('Reviews')
        .doc();
    return await userDetails.set(docChatMap);
  }

// //!? CREATE INDIVIDUAL DOCTOR CORRESPONDENCE, PAYMENTS
//   Future setDocReviews(docChatMap) async {
//     final uuid = await authMethods.getCurrentUID();
//     final DocumentReference userDetails = FirebaseFirestore.instance
//         .collection('doctors')
//         .doc(uuid)
//         .collection('Reviews')
//         .doc();
//     return await userDetails.set(docChatMap);
//   }
// //!? CREATE INDIVIDUAL DOCTOR CORRESPONDENCE, PAYMENTS

//? UPDATES FOR DOCTOR AND PATIENTS BELOW, NOT SET YET!!!!!!!!!!!!!!!!!
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

// //CREATE DATABASE FOR SCHEDULE
//   Future updateUserSchedule(scheduleMap) async {
//     return await userSchedule.add(scheduleMap);
//   }

// //TRYING TO RETURN SAVED SCHEDULE FILES FROM DATABASE
//   Future returnScheduleDetails(sMap) async {
//     return await userSchedule.get();
//   }
}
