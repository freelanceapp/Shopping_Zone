import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shopping_zone/UI/login_page.dart';
import 'package:shopping_zone/style/theme.dart' as Theme;

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new LoginPage(),
      title: new Text('Shopping Zone ',
          style: new TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      image: Image.asset('images/login_logo.png'),

      //backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200.0,
      loaderColor: Colors.white,
      gradientBackground: new LinearGradient(
          colors: [
            Theme.Colors.loginGradientStart,
            Theme.Colors.loginGradientEnd
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    ),
  ));
}
