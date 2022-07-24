// ignore_for_file: unused_local_variable, unused_element, unnecessary_null_comparison, dead_code
import'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/models/user.dart' as u;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/services/database.dart';

class AuthService{

  final  FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FireBaseUser 
  u.myUser? _userFromUser(User? user){
  // var authResult;
   return user  != null ? u.myUser(uid:user.uid) : null;
  }

  //auth change user stream

  Stream<u.myUser?>get user{
    return _auth.authStateChanges().map((User? user) => _userFromUser(user));
    //.map((User user) => _userFromUser(user));
   //.map(_userFromUser);
  }

  //sign in anonymously

  Future signInAnon() async{
    try{
      UserCredential result =  await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
     UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
     User? user = result.user;
     return _userFromUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     User? user = result.user;

     //create a new document for the user with the uid
     await DatabaseService(uid: user!.uid).updateUserData('0','New coffee customer',100);  
     return _userFromUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
    print(e.toString());
    return null;
    }
  }

}