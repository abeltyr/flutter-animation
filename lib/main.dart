import 'package:flutter/material.dart';
import 'screen/home.dart';
import 'animation/sliver.dart';
import 'routeTransitions/fadeIn.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS:CustomPageTransitionBuilder(),
        })
      ),
      initialRoute: '/',
      routes: {'/': (ctx) => HomeScreen(), Sliver.routeName: (ctx) => Sliver()},
    );
  }
}
