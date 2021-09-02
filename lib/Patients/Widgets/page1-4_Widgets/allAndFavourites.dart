import 'package:flutter/material.dart';

class AllAndFavouritesRow extends StatelessWidget {
  const AllAndFavouritesRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.075,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: size.height *0.010,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).primaryColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Theme.of(context).highlightColor,
          labelColor: Theme.of(context).buttonColor,
          tabs: [
            Tab(
              child: Text(
                'All',
                style: TextStyle(),
              ),
            ),
            Tab(
              text: 'Favourites',
            )
          ],
        ),
      ),
    );
  }
}
