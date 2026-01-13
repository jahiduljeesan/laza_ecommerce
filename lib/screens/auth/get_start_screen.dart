import 'package:flutter/material.dart';
import 'package:laza_ecommerce/screens/auth/create_account_screen.dart';
import 'package:laza_ecommerce/screens/auth/sign_in_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/bottom_button.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/master_login_button.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/to_text_button.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LazaColors.lightWhite,
                        ),
                        child: Image.asset('assets/icons/arrow_back.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TitleText(text: 'Let\'s Get Started '),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MasterLoginButton(
                  imagePath: 'assets/icons/ic_facebook.png',
                  label: 'Facebook',
                  color: Color(0xff4267B2),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                MasterLoginButton(
                  imagePath: 'assets/icons/ic_twitter.png',
                  label: 'Twitter',
                  color: Color(0xff1DA1F2),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                MasterLoginButton(
                  imagePath: 'assets/icons/ic_google.png',
                  label: 'Google',
                  color: Color(0xffEA4335),
                  onTap: () {},
                ),
              ],
            ),
          ),

          Column(
            children: [
              ToTextButton(
                callback: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen())
                ),
                directionText: 'Already have an account?',
                buttonText: 'Sign in',
              ),
              BottomButton(
                  label: 'Create an account',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CreateAccountScreen())
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
