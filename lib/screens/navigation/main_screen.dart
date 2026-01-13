import 'package:flutter/material.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:laza_ecommerce/screens/navigation/cart_screen.dart';
import 'package:laza_ecommerce/screens/navigation/home_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarDoubleBullet(
        color: LazaColors.primaryColor,
        selectedIndex: _index,
        items: [
          BottomBarItem(
              iconBuilder: (color) => Image.asset('assets/icons/ic_menu.png', color: color, height: 30, width: 30),
              label: 'Home'
          ),
          BottomBarItem(
              iconBuilder: (color) => Image.asset('assets/icons/ic_bag.png', color: color, height: 30, width: 30),
          label: 'Cart'
          ),
        ],
        onSelect: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _index == 1 ? CartScreen() : HomeScreen(),
    );
  }
}
