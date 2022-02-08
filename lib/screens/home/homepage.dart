import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thelatte/models/user.dart';
import 'package:thelatte/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String detail = '';
  @override
  Widget build(BuildContext context) {
    User? Cuser = FirebaseAuth.instance.currentUser;
    final AuthServices _auth = AuthServices();
    final user = Provider.of<UserData?>(context);

    return Scaffold(
      appBar: AppBar(title: Text("home page "), actions: [
        IconButton(
            onPressed: () async {
              await _auth.signOutGoogle();
            },
            icon: Icon(Icons.logout_rounded))
      ]),
      body: Material(
          color: Colors.greenAccent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email:" + Cuser!.email.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Name: " + Cuser.displayName.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Email verfied: " + Cuser.emailVerified.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("$detail"),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () async {
                        await Cuser.delete();
                      },
                      label: Text("Delete Account from data base")),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () async {
                        await Cuser.sendEmailVerification();
                      },
                      label: Text("verify  Email Address")),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () async {
                        _auth.signOutGoogle();
                      },
                      icon: Icon(Icons.security),
                      label: Text("SignOut")),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          detail = Cuser.providerData.toString();
                        });
                        print(detail);
                      },
                      icon: Icon(Icons.security),
                      label: Text("details With account")),
                ],
              ),
            ),
          )),
    );
  }
}
