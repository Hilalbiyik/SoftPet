import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/src/ui/pages/splash/splash_page.dart';
import 'package:softpati/view/splash/splash_page.dart';
import 'package:softpati/view_model/splash_view_model.dart';
 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => SplashViewModel(),
        child: SplashView(),
      ),
    );
  }
}


