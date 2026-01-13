import 'package:flutter/material.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/subtitle_text.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';

import '../../values/laza_colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Image.asset('assets/icons/ic_menu.png',color: Colors.grey.shade600,),
                    ),
                  ),
        
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
                      child: Image.asset('assets/icons/ic_bag.png',color: Colors.grey.shade600,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: 'Hello'),
                      SubtitleText(text: 'Welcome to Laza')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }
}
