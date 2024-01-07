import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/view/onborarding/onboarding_page.dart';
import 'package:softpati/view_model/onboarding_view_model.dart';

class SplashViewModel with ChangeNotifier {
  void getSplash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => OnBoardingViewModel(),
            child: OnBoardingView(),
          ),
        ),
      );
    });
  }
}