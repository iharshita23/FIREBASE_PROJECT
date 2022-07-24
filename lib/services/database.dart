
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/coffee.dart';
import 'package:firebase_project/models/user.dart';
import 'package:firebase_project/services/database.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference

  final CollectionReference coffeeCollection = FirebaseFirestore.instance.collection('Coffee');
  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength':strength,
    });
  }

    //coffee list from snapshots
    List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot){
      return snapshot.docs.map((doc){
      
        return Coffee(
          name: doc['name'] ?? '',
          strength: doc['strength'] ?? 0,
          sugars: doc['sugars'] ?? '0'
        );
      }).toList();
    }

    //userData from snapshot
    UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
      return UserData(
        uid:uid,
        name: snapshot['name'],
        sugars: snapshot['sugars'],
        strength: snapshot['strength'],
      );
    }

    //get coffee stream
    Stream <List<Coffee>> get coffee {
      return coffeeCollection.snapshots()
      .map(_coffeeListFromSnapshot);
    }

    //get user doc stream
    Stream <UserData> get userData {
      return coffeeCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
    }
  }
