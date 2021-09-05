import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/ratings.dart';

class ReviewsContainer extends StatelessWidget {
  final String? ratings;

  final String reviewText;

  const ReviewsContainer({
    Key? key,
    required this.size,
    this.ratings,
    required this.reviewText,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingStar(
            size: size,
            ratings: ratings!,
          ),
          SizedBox(height: 5),
          Text(reviewText)
        ],
      ),
    );
  }
}

class RegReviewsContainer extends StatelessWidget {
  const RegReviewsContainer({
    Key? key,
    required this.size,
    required this.reviewText, required this.ratings,
  }) : super(key: key);

  final Size size;
  final String reviewText, ratings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          RatingStar(
            size: size,
            ratings: ratings,
          ),
          SizedBox(height: 5),
          Text(
            reviewText,
            // 'Good specialist. A friend advised. Helped to understand some of the things I\'ve puzzled over.',
          )
        ],
      ),
    );
  }
}
