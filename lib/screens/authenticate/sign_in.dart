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
        title: Text("Register--------->"),
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
            child: SingleChildScrollView(
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
                      child: Text("Sign in anonymously")),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.green,
                        hintText: "enter email",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter an email");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.green,
                        hintText: "enter password",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter the password");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      }),
                  ElevatedButton(
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
                      heroTag: 'resetbutton',
                      onPressed: () async {
                        Navigator.pushNamed(context, '/resetPasword');
                      },
                      label: Text("Forget Password")),
                  SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () async {
                        _auth.signInWithGoogle();
                      },
                      icon: Icon(Icons.security),
                      label: Text("SignIn With Google")),
                ],
              ),
            ),
          )),
    );
  }
}
