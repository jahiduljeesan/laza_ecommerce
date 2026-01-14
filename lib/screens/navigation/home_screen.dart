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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF5F6FA),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hint: Text('Search',style: TextStyle(color: Colors.grey.shade600),),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15),
                            prefixIcon: Icon(Icons.search,color: LazaColors.gray,)
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: LazaColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.filter_list,color: Colors.white,),
                    )
                  ],
                ),
              ),

              _categoryText(title: 'Top Categories',)
            ],
          ),
        ),
      ),
    );
  }

  Padding _categoryText({required String title}) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        color: LazaColors.gray
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}
