import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: FadeInImage(
        placeholder: AssetImage("assets/image/fire.jpg"),
        image: NetworkImage(
          "https://static.displate.com/280x392/displate/2019-09-23/146f3ae6abecbe284e09a0d1ae7cda00_267b2958c05ae93e710fe6f72ee63df4.jpg",
        ),
      ),
    );
  }
}
