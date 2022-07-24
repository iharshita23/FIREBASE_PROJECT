import 'package:firebase_project/models/user.dart';
import 'package:firebase_project/screens/wrapper.dart';
import 'package:firebase_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: FirebaseOptions(
      apiKey: "AIzaSyCvmLcoqx49RohA22S2Vrq7CgXRmi197cY", // Your apiKey
      appId: "1:112080198973:ios:cc20f2c014ae3129a53954", // Your appId
      messagingSenderId: "112080198973", // Your messagingSenderId
      projectId: "my-project-9a29c", // Your projectId
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}

