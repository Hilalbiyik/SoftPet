import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softpati/src/ui/component/custom_button.dart';
import 'package:softpati/src/ui/component/custom_text_field.dart';
import 'package:softpati/view/home/home_page.dart';
import 'package:softpati/view/login/login_page.dart';


class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
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
                    height: screenHeight * 0.80,
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
                            'Hesap Oluşturun',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //E-mail Giriş
                          CompCustomTextField(
                            iconData: Icons.person,
                            hintText: "İsim",
                          ),

                          //Şifre Giriş
                          CompCustomTextField(
                            iconData: Icons.person,
                            hintText: "Soy İsim",
                          ),

                          CompCustomTextField(
                            iconData: Icons.mail,
                            hintText: "E-mail",
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[^\s@]+@[^\s@]+\.[^\s@]+'))
                            ],
                          ),
                          CompCustomTextField(
                            iconData: Icons.phone,
                            hintText: "+ 90 (5XX) XXX XXX",
                          ),

                          CompCustomTextField(
                            iconData: Icons.lock,
                            hintText: "Şifre",
                          ),

                          CompCustomTextField(
                            iconData: Icons.lock,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            hintText: "Şifre Tekrarla",
                          ),

                          CompCustomButton(
                            buttonText: 'KAYIT OL',
                            onPressedCallback: () {
                              //Giriş Yap Butonu
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageHome(),
                                ),
                              );
                            },
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Hesabınız zaten var mı?',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Giriş Yap',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageLogin(),
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
