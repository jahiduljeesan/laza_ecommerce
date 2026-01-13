import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laza_ecommerce/screens/auth/onboard_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LazaColors.primaryColor,
      body: Center(
        child: Image.asset('assets/icons/laza_logo.png', height: 30, width: 59),
      ),
    );
  }
}
