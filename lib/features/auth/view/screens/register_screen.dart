import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources/app_validators.dart';
import '../../../home/view/screens/home_screen.dart';
import '../widgets/custom_text_form_field.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();
late int year;
  var formKey = GlobalKey<FormState>();

 // var authService =AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Create Account'.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),

                CustomTextFormField(
                  controller: _firstNameController,
                  label: 'firstName'.tr(),
                  validator: AppValidators.email,
                  prefixIcon: const Icon(Icons.person),
                ),
                SizedBox(height: 16,),
                CustomTextFormField(
                  controller: _lastNameController,
                  label: 'secondName'.tr(),
                  validator: AppValidators.email,
                  prefixIcon: const Icon(Icons.person),
                ),
                SizedBox(height: 16,),

                DropdownButtonFormField<int>(
                  items:  [
                    DropdownMenuItem(value: 1, child: Text('1'.tr())),
                    DropdownMenuItem(value: 2, child: Text('2'.tr())),
                    DropdownMenuItem(value: 3, child: Text('3'.tr())),
                    DropdownMenuItem(value: 4, child: Text('4'.tr())),
                  ],
                  hint: Text('enterYourYear'.tr()),
                  onSaved: (value) {
                    year = value!;
                  },
                  onChanged: (value) {
                    year = value!;
                  },
                ),
                SizedBox(height: 16,),

                CustomTextFormField(
                  controller: _emailController,
                  label: 'email'.tr(),
                  validator: AppValidators.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),

                SizedBox(height: 16,),

                CustomTextFormField(
                  controller: _passwordController,
                  label: 'password'.tr(),
                  validator: AppValidators.password,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.password),
                ),

                ElevatedButton(
                  onPressed: () async {
                    try {
                   /*   User? user =
                      await authService.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      String uid = user!.uid;
                      DatabaseService(uid).updateUserinformation(
                        firstName,
                        lastName,
                        year,
                        email,
                      );
    */
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
                        Text('createAccount'.tr()),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RegisterScreen.routeName,
                    );
                  },
                  child: Text('orYouHaveAnAccountLogin'.tr()),
                ),
              ],
            ),
          ),
        ),
      )
    );

  }
}
