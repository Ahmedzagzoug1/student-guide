import 'package:flutter/material.dart';
import 'package:student_guide/models/constants.dart';
import 'package:student_guide/services/auth.dart';
import 'package:student_guide/views/screens/authentication/register_screen.dart';
import 'package:student_guide/views/screens/homescreeen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  String password = '';

  var formKey = GlobalKey<FormState>();
  var authService = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Constants.decoration,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Text('Login'),
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
                      label: Text('Email'),
                    ),
                    onChanged: (text) {
                      email = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'pls enter Youe Email';
                      }
                      /* if (!isValidEmail(email)) {
                        return 'please Enter a Valid Email ';
                      } */
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
      if (formKey.currentState?.validate() == true) {
        try {
          await authService.signInWithEmailAndPassword(email: email, password: password);

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      }
    },

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sign in'),
                              Icon(Icons.arrow_forward)
                            ]),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text('Or Create Account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
