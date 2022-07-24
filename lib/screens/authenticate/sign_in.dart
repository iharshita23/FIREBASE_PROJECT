import 'package:firebase_project/services/auth.dart';
import 'package:firebase_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/shared/constants.dart';


//1//0gWk5F2DtGvkwCgYIARAAGBASNwF-L9IrxAOcBEd6wyAYaXC0NxdOoH6D9zndvXeB-TnCa1ZNH0MrSL3U3mDAdTa4XNVxcz6o4KY - token
//https://my-project-9a29c.web.app
//Project Console: https://console.firebase.google.com/project/my-project-9a29c/overview

class SignIn extends StatefulWidget {
    final Function toggleView;
  SignIn({required this.toggleView});
 // SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false; 

 //text field state
 String email = '';
 String password = '';
 String error = '';
 
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to our Application'),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
                decoration: textInputDecoration,
                validator: (val) => val!.isEmpty ? 'Enter an email': null ,
                onChanged: (val){
                 setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ character long': null ,
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                 'Sign In',
                 style: TextStyle(color: Colors.white),
                 ),
                onPressed: () async{
                  if(_formkey.currentState!.validate()){
                    setState(() => loading = true);
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result == null){
                    setState(() { error = 'Could not sign in with those credentials';
                    loading = false; 
                  });
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