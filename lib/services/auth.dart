import 'package:firebase_auth/firebase_auth.dart';
import 'package:thelatte/models/user.dart';

class AuthServices
{
  static final FirebaseAuth _auth =FirebaseAuth.instance;



// create userdata obj based on firebase user
  UserData? _userFromFirebaseUser(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

//auth change user stream


Stream<UserData?> get user{
  return  _auth.authStateChanges().map(_userFromFirebaseUser);
}


  //sign in anonymoulsy

  Future signInAnon() async{

    try
    {
         UserCredential result= await _auth.signInAnonymously();
         User? user =result.user;
        
         return user;
    }
    catch(e)
    {
      // ignore: avoid_print
     print(e.toString());
    return null;
    }
  }

  //signout

  Future signOut()async{

    try{
      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }
  }
}