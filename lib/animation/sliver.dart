import 'package:flutter/material.dart';

class Sliver extends StatelessWidget {
  static const routeName = "/sliver";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 154, 214, 1),
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("data"),
              background: FadeInImage(
                placeholder: AssetImage("assets/image/fire.jpg"),
                image: NetworkImage(
                  "https://static.displate.com/280x392/displate/2019-09-23/146f3ae6abecbe284e09a0d1ae7cda00_267b2958c05ae93e710fe6f72ee63df4.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Text("data"),
              SizedBox(
                height: 800,
              )
            ]),
          )
        ],
      )),
    );
  }
}
