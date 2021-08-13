import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/applyButton.dart';
import 'package:medical_app/Patients/Screens/docProfile.dart';

class ImageRatingsAndSignUpButton extends StatelessWidget {
  final Function? press;

  const ImageRatingsAndSignUpButton({
    Key? key,
    required this.size,
    this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/ivan.png',
            fit: BoxFit.contain,
            scale: 0.7,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.0133,
          ),
          child: Text(
            'Ivanov Ivan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        RatingsRow(size: size),
        SizedBox(height: size.height * 0.02),

        //?SignUp FOR CONSULTATION BUTTON
        ApplyButton(
          size: size,
          text: 'Sign up for a consultation',
          horizontal: 0.15,
          press: press,
        )
      ],
    );
  }
}
