import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thelatte/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


   final AuthServices _auth =AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Sign in to TheLatte"),),
      body: Container(

        padding: EdgeInsets.all(10),
        child: ElevatedButton(onPressed: ()async{


         dynamic result=await  _auth.signInAnon();
         if(result!=null)
         {
 print("sign in");
  
  print(result.uid);
 

         }
         else{
print("sign failed");
 print(result);
         }
        
        
        },
         child: Text("Sign in anon")),
      ),
    );
  }
}