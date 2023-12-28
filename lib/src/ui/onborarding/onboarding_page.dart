import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:softpati/src/ui/pages/login/login_page.dart';
import 'package:softpati/theme/app_color.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: buildAnimation(),
            ),
            Expanded(flex: 2, child: buildTitle(context)),
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: FutureBuilder<SwipeableButtonView>(
                    future: buildButton(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<SwipeableButtonView> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return snapshot.data!;
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Text buildTitle(BuildContext context) {
    return Text(
      "SoftPet ile Mutlu Et!",
      style: GoogleFonts.outfit(
          textStyle: textTheme.headline4, color: Colors.grey),
    );
  }

  Future<SwipeableButtonView> buildButton(BuildContext context) async {
    return SwipeableButtonView(
        isFinished: isFinished,
        activeColor: ConstantsColor.purpleColor,
        buttonWidget: Container(
            child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        )),
        buttonText: "Get Started",
        buttontextstyle: GoogleFonts.outfit(
            textStyle: textTheme.button, color: Colors.white),
        onWaitingProcess: () {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              isFinished = true;
            });
          });
        },
        onFinish: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageLogin(),
            ),
          );
          // await Navigator.push(context,
          //     PageTransition(type: PageTransitionType.fade, child: HomeView()));
          setState(() {
            isFinished = false;
          });
        });
  }

  Center buildAnimation() {
    return Center(
      child: Lottie.network(
        ConstantsAdress.sampleLottieWelcomeUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
