import 'package:flutter/material.dart';

class FirebaseLoginScreen extends StatelessWidget {
  final Color backgroundColor = Color(0xff1caebd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dart.png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  // border: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  // border: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Builder(
                  builder: (context) => ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.yellow),
                    ),
                    onPressed: () {
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Login to app'),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
