import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleList {
  String? name;
  // DateTime dateSchedule;
  // DateTime timeSchedule;
  String ?occupation, imageUrl;
  String? years, about;

  ScheduleList({
    this.name,
    // this.dateSchedule,
    // this.timeSchedule,
    this.years,
    this.imageUrl,
    this.about,
    this.occupation
  });

  // formatting for upload to Firbase when creating the Schedule
  Map<String, dynamic> toJson() => {
        'name': name,
        // 'dateSchedule': dateSchedule,
        // 'timeSchedule': timeSchedule,
        'years': years
      };

  // creating a Schedule object from a firebase snapshot
  ScheduleList.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        // dateSchedule = snapshot['dateSchedule'].toDate(),
        // timeSchedule = snapshot['timeSchedule'].toDate(),
        occupation = snapshot['occupation'],
        years = snapshot['years'],
        about = snapshot['about'],
        imageUrl= snapshot['imageUrl'];
}
