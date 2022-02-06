import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thelatte/models/user.dart';
import 'package:thelatte/services/auth.dart';
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    final AuthServices _auth=AuthServices();
    final user=Provider.of<UserData?>(context);
    
    
    return Scaffold(
      appBar: AppBar
      (
      title:Text( user!.uid.toString()),
        
        actions: [
        IconButton(onPressed: ()async{

          await _auth.signOut();



        },
       icon: Icon(Icons.logout_rounded))]),
      body: Center(child: Text("Home Page"),),
    );
  }
}