import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/const.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/images/flutter_blue.png'),
                  // child: ClipOval(
                  //   child: Image.asset(
                  //     'assets/images/flutter_blue.png',
                  //   ),
                  // ),
                  // backgroundImage: AssetImage('assets/images/dart.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Welcome to Flutter!',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'A one-stop portal for you to learn the latest technologies from SCRATCH',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Const.firebaseSignInScreenRoute,
                );
              },
              elevation: 0,
              color: Theme.of(context).primaryColorLight,
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
