import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;

  DatabaseService(this.uid);

  final usersReference= FirebaseFirestore.instance.collection('useres');
  Future updateUserinformation ( String firstName, String lastName,String year, String email, String imageUrl)async{
    return await usersReference.doc(uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "year":year,
      "email": email,
      "imageUrl": imageUrl,
    }
    );
  }
}