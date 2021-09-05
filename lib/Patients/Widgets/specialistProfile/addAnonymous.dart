import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medical_app/Patients/Screens/page18/personalInfo.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/ratings.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/reviewsContainer.dart';
import 'package:flash/flash.dart';

class AddAnnonymousReview extends StatefulWidget {
  // final press;

  final String ratings;

  const AddAnnonymousReview({
    Key? key,
    required this.size,
    // required this.press,
    required this.ratings,
  }) : super(key: key);

  final Size size;

  @override
  _AddAnnonymousReviewState createState() => _AddAnnonymousReviewState();
}

class _AddAnnonymousReviewState extends State<AddAnnonymousReview> {
  TextEditingController reviewTextController = TextEditingController();
  void _showDialogFlash({
    bool persistent = true,
    double vertical = 22,
    double horizontal = 20,
  }) {
    context.showFlashDialog(
      persistent: persistent,
      backgroundColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      content: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Center(
          child: Text(
            'Review will be published during the week!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            barrierColor: Colors.transparent.withOpacity(0.6),
            backgroundColor: Theme.of(context).primaryColor,
            builder: (BuildContext context) {
              return Container(
                height: widget.size.height / 2.6,
                margin: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.07,
                  vertical: widget.size.height * 0.06,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: widget.size.height * 0.055,
                      child: Row(
                        children: [
                          VerticalDivider(
                            width: 10,
                            thickness: 2,
                            color: Theme.of(context).buttonColor,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                '''The review is absolutely anonymous and will be published at a random time throughout the week''',
                                style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    fontStyle: FontStyle.italic,
                                    wordSpacing: 1.5),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: widget.size.height * 0.03,
                      ),
                      child: RatingBar(
                        itemSize: widget.size.width * 0.048,
                        initialRating: double.parse(widget.ratings),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: widget.size.height * 0.03,
                      ),
                      child: CommentBox(
                        minLength: 4,
                        controller: reviewTextController,
                      ),
                    ),
                    // Spacer(),
                    Center(
                      child: ApplyButton(
                        size: widget.size,
                        text: 'Add a review',
                        horizontal: 0.22,
                        press: () {
                          print(reviewTextController.text.toString());
                          Navigator.pop(context);

                          _showDialogFlash(
                            vertical: widget.size.height * 0.04,
                            horizontal: widget.size.width * 0.09,
                          );
                        },
                      ),
                    ),
                    Spacer()
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Add anonymous review',
          style: TextStyle(
              color: Theme.of(context).buttonColor,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
