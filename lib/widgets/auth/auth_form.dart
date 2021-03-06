import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talk/widgets/picker/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  Function submitAuthForm;
  bool isLoading = false;

  AuthForm(this.submitAuthForm, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  void trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (!_isLogin && avatar == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick image'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitAuthForm(email, password, username, avatar ,_isLogin, context);
      print('Current is $_isLogin with $username - $password - $email');
      //
    }
  }

  void pickImage(File image) {
    avatar = image;
  }

  bool _isLogin = true;
  String username;
  String password;
  String email;
  File avatar;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Welcome to Talk',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_isLogin) UserImagePicker(pickImage),
                    TextFormField(
                      key: ValueKey("email"),
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Email is invalid';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                      ),
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey("username"),
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Username is invalid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                        onSaved: (value) {
                          username = value;
                        },
                      ),
                    TextFormField(
                      key: ValueKey("password"),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password is invalid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      ElevatedButton(
                        onPressed: trySubmit,
                        child: _isLogin ? Text('Login') : Text('Register'),
                      ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: _isLogin
                          ? Text('Create new account')
                          : Text('Login with account'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
