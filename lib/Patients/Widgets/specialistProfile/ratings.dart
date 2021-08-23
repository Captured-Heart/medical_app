import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingsRow extends StatelessWidget {
 final String ratings;

  const RatingsRow({
    Key? key,
    required this.size, required this.ratings,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingStar(size: size, ratings: ratings,),
        SizedBox(width: 10),
        AutoSizeText('28'),
        SizedBox(width: 3),
        Icon(FontAwesomeIcons.solidUser, size: 10, color: Color(0xff858585)),
      ],
    );
  }
}

class RatingStar extends StatelessWidget {
 final  String ratings;

  const RatingStar({
    Key? key,
    required this.size, required this.ratings,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: size.width * 0.04,
      initialRating: double.parse(ratings),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        empty: Icon(
          Icons.star,
          color: Colors.grey,
        ),
        half: Icon(
          Icons.star,
          color: Colors.amber,
        ),
        full: Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),

      //!INCASE IN NEEDS TO BE STORED ON THE FIRESTORE, WE USE THE UPDATE HERE
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
