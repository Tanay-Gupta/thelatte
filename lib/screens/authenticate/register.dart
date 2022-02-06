import 'package:flutter/material.dart';
import 'package:thelatte/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  const Register({Key? key, required this.toggleview}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String pass = '';

  final AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register to TheLatte"),
        actions: [
          IconButton(
              onPressed: () {
                widget.toggleview();
              },
              icon: Icon(Icons.login))
        ],
      ),
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
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      pass = value;
                    });
                  },
                  validator: (value) {
                    if (value!.length == 0) {
                      return ("Enter password");
                    } else {
                      return null;
                    }
                  },
                ),
                TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic resutl =
                            _auth.RegisterWithEmailAndPassword(email, pass);
                        print(resutl);
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
