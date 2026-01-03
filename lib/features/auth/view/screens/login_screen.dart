import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_guide/features/auth/view/screens/register_screen.dart';

import 'package:student_guide/features/auth/view/widgets/custom_text_form_field.dart';

import '../../../../core/resources/app_validators.dart';
import '../../../home/view/screens/home_screen.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
//  var authService = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          title: Text('Login'.tr() , style: TextStyle(

          ),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .25,
                  ),
                  CustomTextFormField(controller:_emailController , label: "Email".tr(),

                  validator:AppValidators.email,
                  prefixIcon: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 40,),
                  CustomTextFormField(controller:_passwordController , label: "Password".tr(),
                    validator:AppValidators.password,
                    obscureText: true,
                    prefixIcon: Icon(Icons.password),
                  ),

                  ElevatedButton(
                      onPressed: () async{
      if (formKey.currentState?.validate() == true) {
        try {

       //   await authService.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

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
                              Text('login'.tr()),
                              Icon(Icons.arrow_forward)
                            ]),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text('orCreateAccount'.tr()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
