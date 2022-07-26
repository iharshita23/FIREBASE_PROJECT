// ignore_for_file: prefer_const_constructors

import'package:flutter/material.dart';
import 'package:firebase_project/services/auth.dart';
import 'package:firebase_project/shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});
  //const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final AuthService _auth = AuthService();
final _formkey = GlobalKey<FormState>();
  //text field state
 String email = '';
 String password = '';
 String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Application'),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children:<Widget> [
              SizedBox(height: 20.0),
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email': null ,
                onChanged: (val){
                 setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ character long': null ,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                 'Register',
                 style: TextStyle(color: Colors.white),
                 ),
                onPressed: () async{
                if(_formkey.currentState!.validate()){
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if(result == null){
                    setState(() => error = 'please supply a valid email' );
                  }
                }
                }
               ),
               SizedBox(height: 12.0),
               Text(
                 error,
                 style: TextStyle(color: Colors.red, fontSize: 14.0),
               ),
            ],
          ),
        ),
      ),
    );
  }
}