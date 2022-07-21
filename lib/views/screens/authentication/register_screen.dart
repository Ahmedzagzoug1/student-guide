import 'package:student_guide/models/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:student_guide/services/auth.dart';
import 'package:student_guide/services/database.dart';
import 'package:student_guide/views/screens/homescreeen.dart';

import '../../../../../utils.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'registerScreen';
  String firstName = '';
  String lastName = '';
  String year = '';
  String email = '';
  String password = '';
  var formKey = GlobalKey<FormState>();
  var authService =AuthServices();
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: Constants.decoration,
      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Text('Create Account'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('First Name'),
                    ),
                    onChanged: (text) {
                      firstName = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'pls enter first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Last Name'),
                    ),
                    onChanged: (text) {
                      lastName = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'pls enter last name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Year'),
                    ),
                    onChanged: (text) {
                      year = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'pls enter User name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                    onChanged: (text) {
                      email = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'pls enter Youe Email';
                      }
                    /*  if (!isValidEmail(email)) {
                        return 'please Enter a Valid Email ';
                      }*/
                      return null;
                    },
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        label: Text('Password'),
                      ),
                      onChanged: (text) {
                        password = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'pls enter Password';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 charcters ';
                        }
                        return null;
                      }),
                  ElevatedButton(
                      onPressed: () async{
                        try {
                       User? user=   await  authService.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                       String uid = user !.uid;
                          DatabaseService(uid).updateUserinformation(firstName, lastName,year, email);

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Create Account'),
                              Icon(Icons.arrow_forward)
                            ]),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




}
