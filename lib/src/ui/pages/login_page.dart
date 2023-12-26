import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:softpati/src/ui/component/custom_button.dart';
import 'package:softpati/src/ui/component/custom_header.dart';
import 'package:softpati/src/ui/component/custom_text_field.dart';
import 'package:softpati/src/ui/pages/register_page.dart';

class PageLogin extends StatefulWidget {
  PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffDDBFED),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              // Uygulama Logosu
              Image.asset('assets/welcome.png', scale: 4),
              SizedBox(height: 20),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenHeight * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Login - Text
                          Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(height: 80),
                          //E-mail Giriş
                          CompCustomTextField(
                            iconData: Icons.email,
                            hintText: "Your email",
                          ),
                          SizedBox(height: 20),
                          //Şifre Giriş
                          CompCustomTextField(
                            iconData: Icons.lock,
                            hintText: "Password",
                          ),
                          SizedBox(height: 40),
                          CompCustomButton(
                            buttonText: 'GİRİŞ YAP',
                            onPressedCallback: () {
                              //Giriş Yap Butonu
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageRegister(),
                                ),
                              );
                            },
                          ),
                         
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Don\'t have an account?',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Sign up',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageRegister(),
                                                ),
                                              );
                                            },
                                        )
                                      ]),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
