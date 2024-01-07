import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softpati/theme/app_color.dart';
import 'package:softpati/view_model/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel =
        Provider.of<SplashViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSplash(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Lottie.network(
            ConstantsAdress.sampleLottieUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}