// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/screens/Home%20pages/addressPage.dart';
import 'package:e_shopping_app/screens/Home%20pages/cartScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/order.dart';
import 'package:e_shopping_app/screens/Home%20pages/profileEdit.dart';
import 'package:e_shopping_app/screens/SignInScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<bool> light = [false, true, false];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1500,
              padding: EdgeInsets.only(top: 30, left: 30, right: 15),
              width: double.infinity,
              decoration: BoxDecoration(color: TColors.primary),
            ),
            Positioned(
              right: -60,
              top: -40,
              child: Container(
                  height: 210,
                  width: 210,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(13, 240, 240, 240),
                    borderRadius: BorderRadius.circular(900),
                  )),
            ),
            Positioned(
              right: -70,
              top: 100,
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(13, 240, 240, 240),
                    borderRadius: BorderRadius.circular(900),
                  )),
            ),
            Positioned(
              top: 200,
              left: -4,
              right: -4,
              child: Container(
                  width: double.infinity,
                  height: 5000,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Text(
                              "Account Settings",
                              style: TTextTheme.lightTextTheme.headlineMedium,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 30),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddressPage(),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.security,
                                      size: 28,
                                      color: TColors.primary,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "My Addresses",
                                          style: TTextTheme
                                              .lightTextTheme.headlineSmall,
                                        ),
                                        Text(
                                          "Set shopping delivery address",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartScreen(),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopify,
                                      size: 28,
                                      color: TColors.primary,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "My Cart",
                                          style: TTextTheme
                                              .lightTextTheme.headlineSmall,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            "Add,remove products and move to checkout",
                                            style: TTextTheme
                                                .lightTextTheme.bodyMedium,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyOrderScreen(),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_checkout,
                                      size: 28,
                                      color: TColors.primary,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "My Orders",
                                          style: TTextTheme
                                              .lightTextTheme.headlineSmall,
                                        ),
                                        Text(
                                          "In-progress and completed orders",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bank Account",
                                        style: TTextTheme
                                            .lightTextTheme.headlineSmall,
                                      ),
                                      SizedBox(
                                        width: 260,
                                        child: Text(
                                          "withdraw balance to registered bank account",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.discount,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Coupons",
                                        style: TTextTheme
                                            .lightTextTheme.headlineSmall,
                                      ),
                                      Text(
                                        "List od all the discounted coupons",
                                        style: TTextTheme
                                            .lightTextTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Notifications ",
                                        style: TTextTheme
                                            .lightTextTheme.headlineSmall,
                                      ),
                                      Text(
                                        "Set any kind of notification message",
                                        style: TTextTheme
                                            .lightTextTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Account Privacy",
                                        style: TTextTheme
                                            .lightTextTheme.headlineSmall,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          "Manage data usage and connected account",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Text(
                              "App Settings",
                              style: TTextTheme.lightTextTheme.headlineMedium,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.security,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Load Data",
                                        style: TTextTheme
                                            .lightTextTheme.headlineSmall,
                                      ),
                                      Text(
                                        "Update Data to your cloud Firebase",
                                        style: TTextTheme
                                            .lightTextTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Geolocation",
                                            style: TTextTheme
                                                .lightTextTheme.headlineSmall,
                                          ),
                                          SizedBox(
                                            width: 130,
                                          ),
                                          Switch(
                                            // This bool value toggles the switch.
                                            value: light[0],
                                            activeColor: TColors.primary,
                                            onChanged: (bool value) {
                                              // This is called when the user toggles the switch.
                                              setState(() {
                                                light[0] = value;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          "Set recommendation based on location",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.safety_check_outlined,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Safe Mode",
                                            style: TTextTheme
                                                .lightTextTheme.headlineSmall,
                                          ),
                                          SizedBox(
                                            width: 140,
                                          ),
                                          Switch(
                                            // This bool value toggles the switch.
                                            value: light[2],
                                            activeColor: TColors.primary,
                                            onChanged: (bool value) {
                                              // This is called when the user toggles the switch.
                                              setState(() {
                                                light[2] = value;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          "Search result is safe for all ages",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 28,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "HD Image Quality",
                                            style: TTextTheme
                                                .lightTextTheme.headlineSmall,
                                          ),
                                          SizedBox(
                                            width: 80,
                                          ),
                                          Switch(
                                            // This bool value toggles the switch.
                                            value: light[1],
                                            activeColor: TColors.primary,
                                            onChanged: (bool value) {
                                              // This is called when the user toggles the switch.
                                              setState(() {
                                                light[1] = value;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          "Set image quality to be seen",
                                          style: TTextTheme
                                              .lightTextTheme.bodyMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: Center(
                                child: Text(
                              "Logout",
                              style: TTextTheme.lightTextTheme.titleLarge,
                            )),
                          ),
                        )
                      ])),
            ),
            Positioned(
                //right: 0,
                left: 0,
                top: 0,
                child: FutureBuilder<DocumentSnapshot>(
                    future: users.doc(user!.uid).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Container(
                          // width: double.infinity,
                          //height: 300,
                          margin: EdgeInsets.only(top: 30, left: 30, right: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    "Account",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 38,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(
                                                  data["imgURL"]),
                                          backgroundColor: Colors.transparent,
                                        )),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: 240,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data["first_name"].toString().capitalize}" +
                                                  " " +
                                                  "${data["last_name"].toString().capitalize}",
                                              style: TTextTheme
                                                  .darkTextTheme.headlineSmall,
                                            ),
                                            Text(
                                              user.email.toString(),
                                              style: TTextTheme
                                                  .darkTextTheme.bodyMedium,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("doaa");
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProfileEdit(),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        );
                      }
                      return Text("loading");
                    })),
          ],
        ),
      ),
    );
  }
}
