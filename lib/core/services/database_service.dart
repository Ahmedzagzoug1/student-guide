import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{


  DatabaseService();

  final _firebaseFirestore= FirebaseFirestore.instance;
   addUser ( String firstName, String lastName,String year, String email)async{
    try {
      await _firebaseFirestore.collection('users').add({
        "firstName": firstName,
        "lastName": lastName,
        "year": year,
        "email": email,
        "registerAt": DateTime.now()
      }
      );
    }catch(e){
      print('$e User Not Add');
    }
  }
Future<String> getYear ()async{
    try {
      DocumentSnapshot documentSnapshot = await _firebaseFirestore.collection('users').doc().get();
      var year = documentSnapshot.get("year");
      return year;
    }catch(e){
      return "0";
    }
}
}