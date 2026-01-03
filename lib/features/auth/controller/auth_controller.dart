import 'package:flutter/material.dart';
import 'package:student_guide/core/services/auth_service.dart';
import 'package:student_guide/core/services/database_service.dart';
enum Status { idle, loading, success, error }

class AuthController with ChangeNotifier{
 Status status=Status.idle;
 final AuthServices _authServices=AuthServices();
 final DatabaseService _databaseService=DatabaseService();
 late final currentUser;
 AuthController(){
  checkUserLoggedIn();
 }
 Future<void> checkUserLoggedIn() async {
  currentUser = _authServices.currentUser!;
  if (currentUser != null) {
   status = Status.success;
  } else {
   status = Status.idle;
  }
  notifyListeners();
 }

  login({email,password}) async {

   status=Status.loading;
   notifyListeners();

   try {
   await _authServices.logInWithEmailAndPassword(email: email, password: password);
    status=Status.success;
    notifyListeners();

   }catch(e){
    status=Status.error;
    notifyListeners();

   }
  }
  register({firstName,lastName,year,email,password}) async {
   status=Status.loading;
   notifyListeners();

   try {
   await _authServices.createUserWithEmailAndPassword(email: email, password: password);
  await  _databaseService.addUser(firstName, lastName, year, email);
    status=Status.success;
   notifyListeners();

   }catch(e){
    status=Status.error;
    notifyListeners();

   }
  }

}
