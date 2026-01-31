import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laza_ecommerce/providers/api_provider.dart';
import 'package:laza_ecommerce/providers/cart_provider.dart';
import 'package:laza_ecommerce/screens/auth/splash_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
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
