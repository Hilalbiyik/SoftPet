import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/view/home/home_page.dart';
import 'package:softpati/view/register/register_page.dart';
import 'package:softpati/view_model/home_view_model.dart';
import 'package:softpati/view_model/register_view_model.dart';

class LoginViewModel with ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;


   void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_auth.currentUser != null);
      _showSnackbar(context, "Login successfull");
      _openHomePage(context);
    } on FirebaseAuthException catch (e) {
      _showSnackbar(context, "The password is invalid or the user does not have a password.");
      print(e.message);
    }
  }
  

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: PageRegister(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openHomePage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: PageHome(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

   void _showSnackbar(BuildContext context, String message) {
    //Snackbar nesnesi ürettik
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(message);
  }
}