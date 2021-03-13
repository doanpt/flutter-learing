import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/firebase_login_screen.dart';
import 'package:flutter_ui/screens/home_shopping_screen.dart';
import 'package:flutter_ui/screens/sign_in_screen.dart';
import 'package:flutter_ui/utils/const.dart';

import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color logoGreen = Color(0xff25bcbb);
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final MaterialColor _materialColor = MaterialColor(0xff18203d, {});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          primaryColorLight: logoGreen),
      debugShowCheckedModeBanner: false,
      home: HomeShoppingScreen(),
      routes: {
        Const.signInScreenRoute: (ctx) => SignInScreen(),
        Const.firebaseSignInScreenRoute: (ctx) => FirebaseLoginScreen(),
      },
    );
  }
}
