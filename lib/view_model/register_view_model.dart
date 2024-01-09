import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/model/User.dart';
import 'package:softpati/view/home/home_page.dart';
import 'package:softpati/view/login/login_page.dart';
import 'package:softpati/view_model/home_view_model.dart';
import 'package:softpati/view_model/login_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register(BuildContext context, String email, String password, String name, String surname) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        Users newUser = Users(name, surname,"");

        await _firestore.collection("users").doc(user.uid).set(newUser.toMap());
        alertdialog(context);
      }
    } on FirebaseAuthException catch (e) {
      print("Hata: ${e.message}");
      if (e.code == "email-already-in-use") {
        print("User already exists. Try to log in.");
        _showSnackbar(context, "User already exists. Try to log in ${e}");
      } else {
        print("An error occurred during registration. Please try again.");
      }
    }
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

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: PageLogin(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void alertdialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Kayıt Başarılı"),
          content: Text("You have successfully registered!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _openHomePage(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  }


void _showSnackbar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  print(message);
}