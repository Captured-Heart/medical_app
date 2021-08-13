import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page5_7/appointMentPage.dart';
import 'package:medical_app/Patients/Screens/page8-10/docProfile.dart';

class DoctorsProfileCard extends StatefulWidget {
  const DoctorsProfileCard({
    Key? key,
    required this.size,
    required this.image,
    required this.docName,
    required this.docOccupation,
  }) : super(key: key);

  final Size size;
  final Image image;
  final String docName, docOccupation;

  @override
  _DoctorsProfileCardState createState() => _DoctorsProfileCardState();
}

class _DoctorsProfileCardState extends State<DoctorsProfileCard> {
  bool iconPress = true;

  bool moreDetailsPress = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //!YOU WILL PASS DATA FROM THIS CARD TO THE NEXT PAGE (imageUrl, docName, occupation,experienceYears, salary)

        Navigator.pushReplacementNamed(context, DocProfile.routes);
      },
      child: Container(
        height: moreDetailsPress
            ? widget.size.height * 0.24
            : widget.size.height * 0.62,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        margin: EdgeInsets.only(top: widget.size.height * 0.03),
        child: Stack(
          alignment: Alignment.center,
          children: [
            LikeHeart(
              heartPress: () {
                setState(() {
                  iconPress = !iconPress;
                });
              },
              heartIcon: iconPress
                  ? Icon(
                      FontAwesomeIcons.solidHeart,
                      size: 20,
                    )
                  : Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff3D414E),
                      size: 20,
                    ),
            ),
            MoreDetails(
              moreDetailsText:
                  moreDetailsPress ? 'More Details' : 'Less Details',
              moreDetailsIcon: moreDetailsPress
                  ? Icons.arrow_drop_down
                  : Icons.arrow_drop_up,
              moreDetailsPress: () {
                setState(() {
                  moreDetailsPress = !moreDetailsPress;
                });
              },
            ),
            SignUpButton(size: widget.size),
            FullDoctorProfile(widget: widget),
            !moreDetailsPress
                ? Positioned(
                    top: widget.size.height * 0.18,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ABOUT MYSELF SECTION
                        AboutMyself(
                          widget: widget,
                          text: 'About Myself',
                          divider: Container(
                              height: 0.3,
                              color: Theme.of(context).canvasColor,
                              width: widget.size.width * 0.6),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: AutoSizeText(
                              '''Doctor of doctoral sciences. Great fellow, grandson \n granny, mommy\'s son.'''),
                        ),
                        SizedBox(height: 10),

                        //SPECIALIZATION SECTION
                        AboutMyself(
                          widget: widget,
                          text: 'Specializations',
                          divider: Container(
                              height: 0.2,
                              color: Theme.of(context).canvasColor,
                              width: widget.size.width * 0.6),
                        ),

                        //SPECIALIZATION OPTIONS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            SpecializationOptions(text: 'Violence'),
                            SizedBox(width: 10),
                            SpecializationOptions(text: 'Incest'),
                            SizedBox(width: 10),
                            SpecializationOptions(text: 'LGBTQ'),
                            SizedBox(width: 15),
                            AutoSizeText(
                              'View all (42)',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).buttonColor,
                                // letterSpacing: 1
                              ),
                            )
                          ],
                        ),
                        AboutMyself(
                          widget: widget,
                          text: 'Education',
                          divider: Container(
                              height: 0.5,
                              color: Theme.of(context).canvasColor,
                              width: widget.size.width * 0.6),
                        ),
                        AutoSizeText('Teachers University College, Columbia'),
                        AutoSizeText('Languages: English, Russian, Spanish'),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(0.2),
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidThumbsUp,
                                size: 12,
                              ),
                            ),
                            SizedBox(width: 6),
                            AutoSizeText(
                              '28 reviews',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).buttonColor,
                                // letterSpacing: 1
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}

class FullDoctorProfile extends StatelessWidget {
  const FullDoctorProfile({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DoctorsProfileCard widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      right: 10,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorPicture(size: widget.size, image: widget.image),
            DoctorProfile(
                docName: widget.docName,
                docOccupation: widget.docOccupation,
                size: widget.size)
          ],
        ),
      ),
    );
  }
}

class SpecializationOptions extends StatelessWidget {
  const SpecializationOptions({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 34),
      // height: 24,
      // width: 75,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).accentColor, width: 0.4),
      ),
      child: Center(
        child: AutoSizeText(text),
      ),
    );
  }
}

class AboutMyself extends StatelessWidget {
  const AboutMyself({
    Key? key,
    this.widget,
    required this.text,
    required this.divider,
  }) : super(key: key);

  final DoctorsProfileCard? widget;
  final String text;
  final Widget divider;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(color: Theme.of(context).canvasColor)),
        SizedBox(width: 4),
        divider
      ],
    );
  }
}

class LikeHeart extends StatelessWidget {
  const LikeHeart({
    Key? key,
    this.heartPress,
    required this.heartIcon,
  }) : super(key: key);
  final heartPress;
  final Widget heartIcon;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 15,
      child: GestureDetector(onTap: heartPress, child: heartIcon),
    );
  }
}

class MoreDetails extends StatelessWidget {
  final moreDetailsPress;

  final IconData? moreDetailsIcon;

  final String moreDetailsText;

  const MoreDetails({
    Key? key,
    required this.moreDetailsPress,
    required this.moreDetailsText,
    this.moreDetailsIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Container(
        child: GestureDetector(
          onTap: moreDetailsPress,
          child: Row(
            children: [
              Text(moreDetailsText),
              Icon(moreDetailsIcon),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({
    Key? key,
    required this.docName,
    required this.docOccupation,
    required this.size,
  }) : super(key: key);

  final String docName;
  final String docOccupation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(docName),
        SizedBox(height: 5),
        AutoSizeText(docOccupation),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RatingBar.builder(
              itemSize: size.width * 0.04,
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              //INCASE IN NEEDS TO BE STORED ON THE FIRESTORE, WE USE THE UPDATE HERE
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(width: 4),
            AutoSizeText('28'),
            SizedBox(width: 3),
            Icon(FontAwesomeIcons.solidUser,
                size: 10, color: Color(0xff858585)),
            SizedBox(width: size.width * 0.009),
            AutoSizeText(
              '10 years of experience',
              maxLines: 1,
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText('Nearest appointment: 12:30'),
            SizedBox(
              width: 12,
            ),
            AutoSizeText('2900₽ / hour')
          ],
        ),
      ],
    );
  }
}

class DoctorPicture extends StatelessWidget {
  const DoctorPicture({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.12,
        width: size.width * 0.17,
        margin: EdgeInsets.only(right: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(60))),
        child: image);
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, AppointMentPage.routes);
        },
        child: Container(
          height: size.height * 0.057,
          width: size.width * 0.55,
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: Center(
              child: Text(
            'Sign Up for a Consultation',
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
        ),
      ),
    );
  }
}
