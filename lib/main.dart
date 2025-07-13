import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/pages/card_screen.dart';
import 'package:store_app/pages/category_screen.dart';
import 'package:store_app/pages/home_screen.dart';
import 'package:store_app/pages/product_detail_screen.dart';
import 'package:store_app/pages/product_list_screen.dart';
import 'dart:ui';

import 'package:store_app/pages/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index:
              selectedBottomNavigationIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius:
              BorderRadiusGeometry.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(
                  15,
                ),
              ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50,
              sigmaY: 50,
            ),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex =
                      index;
                });
              },
              type: BottomNavigationBarType
                  .fixed,
              backgroundColor:
                  Colors.transparent,
              elevation: 0,
              // این انجام بده فکر کنم خودش سایه بده
              //  showSelectedLabels: ,
              selectedLabelStyle: TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: Range.blue,
              ),

              showUnselectedLabels: false,

              currentIndex:
                  selectedBottomNavigationIndex,
              items: [
                BottomNavigationBarItem(
                  label: 'حساب کاربری',
                  icon: Image.asset(
                    'assets/images/icon_profile.png',
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Range
                              .blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(
                            0,
                            13,
                          ),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/icon_profile_active.png',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'سبد خرید ',
                  icon: Image.asset(
                    'assets/images/icon_basket.png',
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Range
                              .blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(
                            0,
                            13,
                          ),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/icon_basket_active.png',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'دسته بندی',
                  icon: Image.asset(
                    'assets/images/icon_category.png',
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Range
                              .blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(
                            0,
                            13,
                          ),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/icon_category_active.png',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'خانه',
                  icon: Image.asset(
                    'assets/images/icon_home.png',
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Range
                              .blueIndicator,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(
                            0,
                            13,
                          ),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/icon_home_active.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      ProductDetailScreen(),
      CardScreen(),
      CategoryScreen(),
      HomeScreen(),
    ];
  }
}
