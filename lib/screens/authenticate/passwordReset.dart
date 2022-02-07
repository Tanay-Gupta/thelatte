import 'package:flutter/material.dart';
import 'package:thelatte/services/auth.dart';

class PasswordResetUsingMail extends StatefulWidget {
  PasswordResetUsingMail({Key? key}) : super(key: key);

  @override
  State<PasswordResetUsingMail> createState() => _PasswordResetUsingMailState();
}

class _PasswordResetUsingMailState extends State<PasswordResetUsingMail> {
  String email = '';

  final _formkey = GlobalKey<FormState>();
  AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
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
                TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _auth.ResetPasswordUsingEmail(email);
                        //  if(resutl==null)
                      }
                    },
                    child: Text("Sign up"))
              ],
            ),
          )),
    );
  }
}
