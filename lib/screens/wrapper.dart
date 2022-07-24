import 'package:firebase_project/models/user.dart' as u;
import 'package:firebase_project/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/screens/home/home.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<u.myUser?>(context);
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}