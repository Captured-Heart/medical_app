import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Widgets/specialistProfile/ratings.dart';

class ImageRatingsAndSignUpButton extends StatelessWidget {
  final Function? press;

  final String imageUrl, name, buttonText, ratings;


  const ImageRatingsAndSignUpButton({
    Key? key,
    required this.size,
    this.press,
    required this.imageUrl,
    required this.name,
    required this.buttonText, required this.ratings,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
                      child: Container(
              height: size.height * 0.13,
              width: size.width * 0.22,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).buttonColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.0133,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        RatingsRow(size: size, ratings: ratings,),
        SizedBox(height: size.height * 0.02),

        //?SignUp FOR CONSULTATION BUTTON
        ApplyButton(
          size: size,
          text: buttonText,
          horizontal: 0.15,
          press: press,
        )
      ],
    );
  }
}


class RegImageRatingsAndSignUpButton extends StatelessWidget {
  final Function? press;

  final String imageUrl, name, buttonText, ratings;


  const RegImageRatingsAndSignUpButton({
    Key? key,
    required this.size,
    this.press,
    required this.imageUrl,
    required this.name,
    required this.buttonText, required this.ratings,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
                      child: Container(
              height: size.height * 0.17,
              width: size.width * 0.27,
              child: 
              // Image.asset(imageUrl, scale: 0.8,),
              
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).buttonColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.0133,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        RatingsRow(size: size, ratings: ratings,),
        SizedBox(height: size.height * 0.02),

        //?SignUp FOR CONSULTATION BUTTON
        ApplyButton(
          size: size,
          text: buttonText,
          horizontal: 0.15,
          press: press,
        )
      ],
    );
  }
}
