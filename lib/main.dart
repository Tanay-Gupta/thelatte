import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:thelatte/models/user.dart';
import 'package:thelatte/screens/authenticate/passwordReset.dart';
import 'package:thelatte/screens/authenticate/register.dart';
import 'package:thelatte/screens/wrapper.dart';
import 'package:thelatte/services/auth.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        routes: {
          '/': (context) => Wrapper(),
          '/resetPasword': (context) => PasswordResetUsingMail(),
        },
      ),
    );
  }
}
