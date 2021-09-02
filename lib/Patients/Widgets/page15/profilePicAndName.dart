import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfPicAndName extends StatelessWidget {
  const ProfPicAndName({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String imageUrl, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.05, top: 10),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.17,
              decoration: BoxDecoration(shape: BoxShape.circle),
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
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  
                ),
              ),
              // SizedBox(height: 5),
              //  Text(
              //   name,
              //   style: TextStyle(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 20,
                  
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
