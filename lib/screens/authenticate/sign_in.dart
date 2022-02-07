import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thelatte/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  const SignIn({Key? key, required this.toggleview}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String pass = '';
  String error = '';

  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in to TheLatte"),
        actions: [
          IconButton(
              onPressed: () {
                widget.toggleview();
              },
              icon: Icon(Icons.sick))
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      dynamic result = await _auth.signInAnon();
                      if (result != null) {
                        print("sign in");

                        print(result.uid);
                      } else {
                        print("sign failed");
                        print(result);
                      }
                    },
                    child: Text("Sign in anon")),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) {
                    return ("Enter an email");
                  } else {
                    return null;
                  }
                }, onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                }),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) {
                    return ("Enter the password");
                  } else {
                    return null;
                  }
                }, onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                }),
                TextButton(
                    onPressed: () {
                      print(email);
                      print(pass);

                      if (_formkey.currentState!.validate()) {
                        dynamic result =
                            _auth.SignInWithEmailAndPassword(email, pass);
                        if (result == null) {
                          setState(() {
                            error = "Wrong password";
                          });
                        }
                      }
                    },
                    child: Text("Sign in")),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton.extended(
                    onPressed: () async {
                      Navigator.pushNamed(context, '/resetPasword');
                    },
                    label: Text("Forget Password")),
              ],
            ),
          )),
    );
  }
}
