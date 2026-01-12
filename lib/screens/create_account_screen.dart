import 'package:flutter/material.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/auth_text_field.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/bottom_button.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/remember_switch.dart';

import '../values/laza_colors.dart';
import '../widgets/auth_widgets/title_text.dart';
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _rememberMe = true;

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
              const SizedBox(height: 20,),
              TitleText(text: 'Sign up ', ),
            ],
          ),

          Column(
            children: [
              AuthTextField(
                title: 'Username',
                hint: 'eg. Abdul Karim',
              ),
              const SizedBox(height: 12,),

              AuthTextField(
                title: 'Password',
                hint: 'eg. 123456',
              ),
              const SizedBox(height: 12,),

              AuthTextField(
                title: 'Username',
                hint: 'Edward Camavinga',
              ),

              const SizedBox(height: 30,),

              RememberSwitch(
                value: _rememberMe,
                onChanged: (val) => setState(() => _rememberMe = val),
              )
            ],
          ),

          BottomButton(
            label: 'Sign up',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
