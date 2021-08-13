import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Screens/page18/personalInfo.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';

class AddAnnonymousReview extends StatelessWidget {
  final press;

  const AddAnnonymousReview({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;

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
                height: size.height / 2.6,
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07,
                  vertical: size.height * 0.06,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.055,
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
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.04,
                      ),
                      child: CommentBox(
                        minLength: 4,
                      ),
                    ),
                    Center(
                      child: ApplyButton(
                        size: size,
                        text: 'Add a review',
                        horizontal: 0.22,
                        press: press,
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
