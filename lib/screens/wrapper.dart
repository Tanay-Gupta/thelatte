

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thelatte/models/user.dart';
import 'package:thelatte/screens/authenticate/authenticate.dart';
import 'package:thelatte/screens/authenticate/sign_in.dart';
import 'package:thelatte/screens/home/homepage.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final user=Provider.of<UserData?>(context);
    
    if(user==null)
    {
     
    return Authenticate();
    }
    else
    {
         return HomePage();
    }
  

    
  }
}