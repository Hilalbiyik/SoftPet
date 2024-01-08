import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/model/Person.dart';
import 'package:softpati/view/home/home_page.dart';
import 'package:softpati/view/login/login_page.dart';
import 'package:softpati/view_model/home_view_model.dart';
import 'package:softpati/view_model/login_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register(BuildContext context, String email, String password, String fullName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(fullName);
        await _firestore.collection("users").doc(user.uid).set({
          "fullName": fullName,
        });
      }
      _openHomePage(context);
    } on FirebaseAuthException catch (e) {
      print("Hata: ${e.message}");
      if (e.code == "email-already-in-use") {
        // E-posta adresi zaten kullanımda
        print("User already exists. Try to log in.");
      } else {
        // Diğer hata durumları
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
}
