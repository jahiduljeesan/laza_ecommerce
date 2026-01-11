import 'package:flutter/material.dart';
import 'package:laza_ecommerce/screens/splash_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: LazaColors.primaryColor),
        fontFamily: 'Sora'
      ),
      home: SplashScreen(),
    );
  }
}
