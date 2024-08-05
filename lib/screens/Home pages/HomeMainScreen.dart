// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/model/wishlist.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/ProductScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/cartScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int currentSlide = 0;
  // bool isHeart=false;
  List listImageCategory = [
    {"image": TImages.sportIcon, "name": "Sports"},
    {"image": TImages.furnitureIcon, "name": "furniture"},
    {"image": TImages.electronicsIcon, "name": "Electronics"},
    {"image": TImages.clothIcon, "name": "Clothes"},
    {"image": TImages.animalIcon, "name": "Animal"},
    {"image": TImages.shoeIcon, "name": "Shoe"},
    {"image": TImages.cosmeticsIcon, "name": "Cosmetics"},
    {"image": TImages.jeweleryIcon, "name": "Jewelery"},
  ];
  List bannerList = [
    AssetImage(TImages.banner1),
    AssetImage(TImages.banner3),
    AssetImage(TImages.banner4),
    AssetImage(TImages.banner5),
    AssetImage(TImages.banner6),
    AssetImage(TImages.banner7),
    AssetImage(TImages.banner8),
    AssetImage(TImages.banner2),
  ];
  @override
  void initState() {
    super.initState();
    funAddFav();
    funDefineQuentities();
  }

  @override
  Widget build(BuildContext context) {
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    final user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: SingleChildScrollView(
          child: Stack(children: [
        Container(
          height: 8000,
          padding: EdgeInsets.only(top: 30, left: 0, right: 0),
          width: double.infinity,
          decoration: BoxDecoration(color: TColors.primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
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
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good day for shopping",
                                style: TTextTheme.darkTextTheme.bodyMedium,
                              ),
                              // SizedBox(height: 10,),
                              Text(
                                "${data["first_name"].toString().capitalize}" +
                                    " " +
                                    "${data["last_name"].toString().capitalize}",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }

                        return Center(child: Text("loading"));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search in Store",
                      contentPadding: EdgeInsets.only(bottom: 9, top: 9),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Popular Categories",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 5,
                    );
                  },
                  itemCount: listImageCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: index == 0 ? 10 : 0,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => CartScreen(),
                                  //     ));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Image(
                                          height: 30,
                                          width: 30,
                                          image: AssetImage(
                                              listImageCategory[index]
                                                  ["image"])),
                                    )),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: 75,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    listImageCategory[index]["name"],
                                    // textWidthBasis: TextWidthBasis.parent
                                    // ,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: -130,
          top: -100,
          child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(13, 240, 240, 240),
                borderRadius: BorderRadius.circular(900),
              )),
        ),
        Positioned(
          right: -150,
          top: 130,
          child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                color: Color.fromARGB(13, 240, 240, 240),
                borderRadius: BorderRadius.circular(900),
              )),
        ),
        Positioned(
          top: 370,
          left: -4,
          right: -4,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            height: 8000,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 230,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 210,
                        width: 500,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              currentSlide = value;
                            });
                          },
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 300,
                              width: 400,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              decoration: BoxDecoration(
                                //  color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: bannerList[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: currentSlide % 3 == index ? 20 : 20,
                                height: 4,
                                margin: EdgeInsets.only(right: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentSlide % 3 == index
                                      ? TColors.primary
                                      : Colors.grey.shade400,
                                  //border: Border.all(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: GridView.builder(
                    itemCount: products.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 280,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 280,
                            width: 200,
                            child: Stack(
                              children: [
                                Container(
                                  height: 280,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(1, 1),
                                          blurStyle: BlurStyle.normal,
                                          blurRadius: 4,
                                          spreadRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                              products: products[index],
                                              index: index,
                                            ),
                                          ));
                                    },
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              padding: EdgeInsets.only(top: 8),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      250, 250, 250, 0.92),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Image.asset(
                                                products[index].image,
                                                width: 160,
                                                height: 160,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.only(left: 7),
                                              child: Text(
                                                products[index].title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              products[index].category,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.verified,
                                              color: TColors.primary,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, bottom: 10),
                                              //   padding: EdgeInsets.only(right: 8, left: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                "\$ ${products[index].price}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFav[index] = !isFav[index];

                                          if (isFav[index] == true) {
                                            objectCartData.addCartWishlist(
                                                WishlistItem(
                                                    quantity: 0,
                                                    product: products[index],
                                                    is_heart: false));
                                          } else {
                                            objectCartData
                                                .removeCartItemWishlist(
                                                    products[index]);
                                          }
                                        });
                                      },
                                      child: Container(
                                        //padding: EdgeInsets.all(),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: 35,
                                        height: 35,
                                        margin:
                                            EdgeInsets.only(right: 13, top: 13),
                                        child: isFav[index]
                                            ? Icon(
                                                CupertinoIcons.heart_fill,
                                                color: Colors.red,
                                                size: 23,
                                              )
                                            : Icon(
                                                CupertinoIcons.heart,
                                                color: Colors.black,
                                                size: 23,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      margin:
                                          EdgeInsets.only(right: 0, bottom: 0),
                                      decoration: BoxDecoration(
                                          color: allQuantity[index] > 0
                                              ? TColors.primary
                                              : Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight:
                                                  Radius.circular(15))),
                                      child: allQuantity[index] > 0
                                          ? Center(
                                              child: Text(
                                                "${allQuantity[index]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          : Icon(
                                              CupertinoIcons.add,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: 40,
                                        height: 20,
                                        margin:
                                            EdgeInsets.only(left: 10, top: 20),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                185, 255, 235, 59),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Center(child: Text("78%"))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 35,
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ));
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 25,
                      )),
                  Positioned(
                    right: 7,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(900),
                      ),
                      child: Center(
                          child: Text(
                        objectCartData.totalQuantityFun().toString(),
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ))
      ])),
    );
  }
}
