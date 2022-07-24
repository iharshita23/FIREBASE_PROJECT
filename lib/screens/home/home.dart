import 'package:firebase_project/models/coffee.dart';
import 'package:firebase_project/screens/home/settings_form.dart';
import 'package:firebase_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_project/screens/home/coffee_list.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
      return Container(
       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
       child: SettingsForm(),
      );
      });
    }

     return StreamProvider <List<Coffee>?>.value(
        initialData: null,
       value: DatabaseService(uid: '').coffee,
       child: Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
       title: Text('FireBase Project'),
       backgroundColor: Colors.brown[400],
       elevation: 0.0,
       actions: <Widget>[
         FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('logout'),
           onPressed: () async {
             await _auth.signOut();
           },
         ),
         FlatButton.icon(
           icon: Icon(Icons.settings),
          label: Text('settings'),
          onPressed: () => _showSettingsPanel(),
        )
       ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('coffee_bg.png'),
            fit: BoxFit.contain,
        ),
        ),
         child: CoffeeList()
    ),
    ),
  );
  }
}