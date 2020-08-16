import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final String uid;
  DataService({this.uid});

  final CollectionReference profileCollection =
      Firestore.instance.collection('profiles');

  Future updateProfile(String name) async {
    return await profileCollection.document(uid).setData({'name': name});
  }
}
