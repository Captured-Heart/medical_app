import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/ratings.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingStar(size: size),
          SizedBox(height: 5),
          Text(
              'Good specialist. A friend advised. Helped to understand some of the things I\'ve puzzled over.')
        ],
      ),
    );
  }
}
