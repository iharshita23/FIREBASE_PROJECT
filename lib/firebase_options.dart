// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCvmLcoqx49RohA22S2Vrq7CgXRmi197cY',
    appId: '1:112080198973:web:e9941fca36839ef5a53954',
    messagingSenderId: '112080198973',
    projectId: 'my-project-9a29c',
    authDomain: 'my-project-9a29c.firebaseapp.com',
    databaseURL: 'https://my-project-9a29c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-project-9a29c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA90BjgYJ93V5-BXSJz4j230LlFZj62THo',
    appId: '1:112080198973:android:382965cfaa6df301a53954',
    messagingSenderId: '112080198973',
    projectId: 'my-project-9a29c',
    databaseURL: 'https://my-project-9a29c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-project-9a29c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHYpWHLJnLrFWSI3YJQjZ3YjuZk2Kfsp8',
    appId: '1:112080198973:ios:cc20f2c014ae3129a53954',
    messagingSenderId: '112080198973',
    projectId: 'my-project-9a29c',
    databaseURL: 'https://my-project-9a29c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-project-9a29c.appspot.com',
    iosClientId: '112080198973-f1bl168ccuf8qipf9ka7njmfe01brf3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHYpWHLJnLrFWSI3YJQjZ3YjuZk2Kfsp8',
    appId: '1:112080198973:ios:cc20f2c014ae3129a53954',
    messagingSenderId: '112080198973',
    projectId: 'my-project-9a29c',
    databaseURL: 'https://my-project-9a29c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-project-9a29c.appspot.com',
    iosClientId: '112080198973-f1bl168ccuf8qipf9ka7njmfe01brf3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseProject',
  );
}
