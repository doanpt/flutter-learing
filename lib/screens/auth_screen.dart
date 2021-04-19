import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _submitAuthForm(String email, String password, String username,
      bool isLogin, BuildContext ctx) async {
    UserCredential credential;
    try {
      if (isLogin) {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      }
    } on PlatformException catch (err) {
      var message = 'An error occurs, please check your credential!';
      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme
              .of(context)
              .errorColor,
        ),
      );
    } catch (err) {
      print(err);
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err.message),
          backgroundColor: Theme
              .of(context)
              .errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: AuthForm(_submitAuthForm,),
    );
  }
}
