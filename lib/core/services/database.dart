import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;

  DatabaseService(this.uid);

  final usersReference= FirebaseFirestore.instance.collection('Users');
  Future updateUserinformation ( String firstName, String lastName,String year, String email)async{
    return await usersReference.doc(uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "year":year,
      "email": email,

    }
    );
  }
Future<String> getYear ()async{
    try {
      DocumentSnapshot documentSnapshot = await usersReference.doc(uid).get();
      var year = documentSnapshot.get("year");
      return year;
    }catch(e){
      return "0";
    }
}
}