import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softpati/theme/app_color.dart';
import 'package:softpati/view/component/custom_button.dart';
import 'package:softpati/view/component/custom_text_field.dart';
import 'package:softpati/view_model/register_view_model.dart';

class PageRegister extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();  
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNamecontroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ConstantsColor.lightPurpleColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              buildHeaderLogo(),
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
                          _buildCreateAccountText(),
                          SizedBox(
                            height: 10,
                          ),

                          FadeInUp(
                            child: CompCustomTextField(
                              obscureText: false,
                              controller: _firstNameController,
                              iconData: Icons.person,
                              hintText: "İsim",
                            ),
                          ),
                          FadeInUp(
                            child: CompCustomTextField(
                              obscureText: false,
                              controller: _lastNamecontroller,
                              iconData: Icons.person,
                              hintText: "Soy İsim",
                            ),
                          ),
                          FadeInUp(
                            child: CompCustomTextField(
                               obscureText: false,
                              controller: _emailController,
                              iconData: Icons.mail,
                              hintText: "E-mail",
                            ),
                          ),
                          FadeInUp(
                            child: CompCustomTextField(
                               obscureText: true,
                              controller: _passwordController,
                              iconData: Icons.lock,
                              hintText: "Şifre",
                            ),
                          ),
                          _buildRegisterButton(context),
                          _buildLoginText(context)
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

  FadeInUp _buildLoginText(BuildContext context) {
    RegisterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Hesabınız zaten var mı?',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Giriş Yap',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            viewModel.openLoginPage(context);
                          },
                      )
                    ]),
              ),
            )));
  }

  FadeInUp _buildRegisterButton(BuildContext context) {
     RegisterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
      child: CompCustomButton(
        buttonText: 'KAYIT OL',
        onPressedCallback: () {
         viewModel.register(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _firstNameController.text.trim(),
           _lastNamecontroller.text.trim(),

        );
        },
      ),
    );
  }

  Text _buildCreateAccountText() {
    return Text(
      'Hesap Oluşturun',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 35,
      ),
    );
  }
}

Widget buildHeaderLogo() {
  return FadeInDown(
    child: Lottie.asset(
      ConstantsAdress.donate_animation,
      height: 180,
      fit: BoxFit.cover,
    ),
  );
}
