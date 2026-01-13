import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/screens/navigation/main_screen.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/auth_text_field.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/bottom_button.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/remember_switch.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/subtitle_text.dart';

import '../../values/laza_colors.dart';
import '../../widgets/auth_widgets/title_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: LazaColors.lightWhite,
                        ),
                        child: Image.asset('assets/icons/arrow_back.png'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              TitleText(text: 'Welcome'),
              SubtitleText(text: 'Please enter your data to continue'),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuthTextField(title: 'Username', hint: 'eg. john paul'),
              AuthTextField(title: 'Password', hint: 'Enter password..'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              RememberSwitch(
                value: _rememberMe,
                onChanged: (val) => setState(() => _rememberMe = val),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600, // gray color for default text
                    ),
                    children: [
                      TextSpan(
                        text:
                            'By connecting your account confirm that you agree with our ',
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LazaColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              BottomButton(label: 'Sign in', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
