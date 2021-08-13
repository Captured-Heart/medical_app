import 'package:flutter/material.dart';
import 'package:medical_app/page1/doctorProfileCard.dart';

class AllAndFavTabBarView extends StatelessWidget {
  const AllAndFavTabBarView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.45,
      child: TabBarView(
        children: [
          ListView(children: [
            //?ALL DOCTORS
            DoctorsProfileCard(
              size: size,
              image: Image.asset(
                'assets/images/ivan.png',
                fit: BoxFit.fill,
              ),
              docName: 'Ivanov Ivan',
              docOccupation: 'Psychotherapist',
            ),

            //? #2
            DoctorsProfileCard(
              size: size,
              image: Image.asset(
                'assets/images/peter.png',
                fit: BoxFit.fill,
              ),
              docName: 'Petrov Peter',
              docOccupation: 'Psychotherapist',
            ),

            //? #3
            DoctorsProfileCard(
              size: size,
              image: Image.asset(
                'assets/images/oleg.jpg',
                fit: BoxFit.fill,
              ),
              docName: 'Petrov Peter',
              docOccupation: 'Psychotherapist',
            ),

            //? #4
            DoctorsProfileCard(
              size: size,
              image: Image.asset(
                'assets/images/peter.png',
                fit: BoxFit.fill,
              ),
              docName: 'Petrov Peter',
              docOccupation: 'Psychotherapist',
            ),
          ]),

          //?Doctor 2
          ListView(
            children: [
              DoctorsProfileCard(
                size: size,
                image: Image.asset(
                  'assets/images/peter.png',
                  fit: BoxFit.fill,
                ),
                docName: 'Petrov Peter',
                docOccupation: 'Psychotherapist',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
