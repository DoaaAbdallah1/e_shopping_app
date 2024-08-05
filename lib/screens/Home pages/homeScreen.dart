// ignore_for_file: prefer_const_constructors, file_names, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/HomeMainScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/Profile.dart';
import 'package:e_shopping_app/screens/Home%20pages/StoreScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/wishlistScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
//  final int currentTab;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  List listScreen = [
    HomeMainScreen(),
    StoreScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
  //  currentTab = widget.currentTab;
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 70,
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 68,
                child: Stack(
                  children: [
                    Positioned(
                      top: -12,
                      child: IconButton(
                        onPressed: () => setState(() {
                          currentTab = 0;
                          objectCartData.notifyListeners();
                        }),
                        icon: Icon(
                          Icons.home,
                          size: 26,
                          color: currentTab == 0
                              ? TColors.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: currentTab == 0 ? 0 : 0,
                        right: 10,
                        left: 5,
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 13,
                            color: currentTab == 0
                                ? Colors.black54
                                : Colors.grey.shade600,
                            fontWeight: currentTab == 0
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 68,
                child: Stack(
                  children: [
                    Positioned(
                      top: -12,
                      child: IconButton(
                        onPressed: () => setState(() {
                          currentTab = 1;
                          objectCartData.notifyListeners();
                        }),
                        icon: Icon(
                          Icons.shopping_bag_rounded,
                          size: 26,
                          color: currentTab == 1
                              ? TColors.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: currentTab == 1 ? 0 : 0,
                        right: 10,
                        left: 5,
                        child: Text(
                          "Store",
                          style: TextStyle(
                            fontSize: 13,
                            color: currentTab == 1
                                ? Colors.black54
                                : Colors.grey.shade600,
                            fontWeight: currentTab == 1
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 68,
                child: Stack(
                  children: [
                    Positioned(
                      top: -12,
                      child: IconButton(
                        onPressed: () => setState(() {
                          currentTab = 2;
                          objectCartData.notifyListeners();
                        }),
                        icon: Icon(
                          CupertinoIcons.heart,
                          size: 26,
                          color: currentTab == 2
                              ? TColors.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: currentTab == 2 ? 0 : 0,
                        right: 8,
                        left: -4,
                        child: Text(
                          "Wishlist",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: currentTab == 2
                                ? Colors.black54
                                : Colors.grey.shade600,
                            fontWeight: currentTab == 2
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 57,
                child: Stack(
                  children: [
                    Positioned(
                      top: -12,
                      child: IconButton(
                        onPressed: () => setState(() {
                          currentTab = 3;
                          objectCartData.notifyListeners();
                        }),
                        icon: Icon(
                          Icons.person_outline,
                          size: 26,
                          color: currentTab == 3
                              ? TColors.primary
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: currentTab == 3 ? 0 : 0,
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 13,
                            color: currentTab == 3
                                ? Colors.black54
                                : Colors.grey.shade600,
                            fontWeight: currentTab == 3
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        body: listScreen[ currentTab],
      ),
    );
  }
}
