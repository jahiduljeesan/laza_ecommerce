import 'package:flutter/material.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Builder(
                    builder: (context) {
                      return InkWell(
                        onTap: () => Scaffold.of(context).closeDrawer(),
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: LazaColors.lightWhite,
                          ),
                          child: RotatedBox(
                            quarterTurns: 1,
                              child: Image.asset('assets/icons/ic_menu.png',color: Colors.grey.shade600,)
                          ),
                        ),
                      );
                    }
                ),
              ),

              SizedBox(height: size.width * .06,),

              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/profile_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Md. Jahidul Islam',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Verified Profile',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(.6),
                                  ),
                                ),
                                SizedBox(width: size.width * .01),
                                Icon(
                                  Icons.verified,
                                  size: 14,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                height: 50,
                width: size.width * .80,
                decoration: BoxDecoration(
                  color: LazaColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Order',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '12',
                        style: TextStyle(
                          fontSize: 15,
                          color: LazaColors.offWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * .03),

              _drawerButton(
                size,
                icon: Icons.dark_mode_outlined,
                label: 'Dark Mode',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.info_outline,
                label: 'Account Information',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.lock_open,
                label: 'Password',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.shopping_bag_outlined,
                label: 'Order',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.add_card_outlined,
                label: 'My Cards',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.favorite_border,
                label: 'Wishlist',
                onTap: () {},
              ),

              _drawerButton(
                size,
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {},
              ),
            ],
          ),

          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 25,
                    color: Colors.red,
                  ),
                  SizedBox(width: size.width * .03),
                  Text(
                    'Log out',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _drawerButton(
    Size size, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 25, color: Colors.black.withOpacity(.6)),
            SizedBox(width: size.width * .03),
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
