import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laza_ecommerce/models/cart/cart_request.dart';
import 'package:laza_ecommerce/providers/api_provider.dart';
import 'package:laza_ecommerce/screens/auth/splash_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: LazaColors.primaryColor),
          fontFamily: 'Sora'
        ),
        home: SplashScreen(),
      ),
    );
  }
}
