import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:send_data/model/user_model.dart';

class FirebaseManager{
  static final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
  
  Future<void> addUser(UserDataModel user) async{
    await userCollection.add(user.toMap());
  }
  
  static Future<void> deletUser(String id) async{
    await userCollection.doc(id).delete();
  }

  
  Stream<List<UserDataModel>> getUser(){
    return userCollection.snapshots().map((event) {
      return event.docs.map((e) {
       return UserDataModel.fromMap(e.data() as Map<String, dynamic>, e.id);
      }).toList();
    });
  }
}