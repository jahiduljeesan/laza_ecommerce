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
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/icons/profile_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Md. Jahidul Islam',
                          maxLines: 2,
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                            SizedBox(width: size.width * .01,),
                            Icon(
                              Icons.verified,
                              size: 14,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
          const SizedBox(height: 20,),

          Container(
            height: 50,
            width: size.width * .50,
            decoration: BoxDecoration(
              color: LazaColors.primaryColor,
              borderRadius: BorderRadius.circular(10)
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
                      color: Colors.white
                    ),
                  ),
                  Text(
                      '12',
                    style: TextStyle(
                        fontSize: 15,
                      color: LazaColors.offWhite
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * .03,),

          _drawerButton(
              size,
              icon: Icons.light_mode_outlined,
              label: 'Dark Mode'
          )
        ],
      ),
    );
  }

  InkWell _drawerButton(
      Size size, {
        required IconData icon ,
        required String label,
      }) {
    return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(Icons.light_mode_outlined,size: 26,),
                SizedBox(width: size.width * .03,),
                Text(
                  label,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
