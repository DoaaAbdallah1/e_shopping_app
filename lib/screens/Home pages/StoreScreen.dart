// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/PartCategory/category.dart';
import 'package:e_shopping_app/screens/Home%20pages/brand.dart';
import 'package:e_shopping_app/screens/Home%20pages/cartScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List listImageCategory = [
    {"image": TImages.sportIcon, "name": "Sports", "isActiveCategory": false},
    {
      "image": TImages.furnitureIcon,
      "name": "furniture",
      "isActiveCategory": false
    },
    {
      "image": TImages.electronicsIcon,
      "name": "Electronics",
      "isActiveCategory": false
    },
    {"image": TImages.clothIcon, "name": "Clothes", "isActiveCategory": false},
    {"image": TImages.animalIcon, "name": "Animal", "isActiveCategory": false},
    {"image": TImages.shoeIcon, "name": "Shoe", "isActiveCategory": false},
    {
      "image": TImages.cosmeticsIcon,
      "name": "Cosmetics",
      "isActiveCategory": false
    },
    {
      "image": TImages.jeweleryIcon,
      "name": "Jewelery",
      "isActiveCategory": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

        final objectCartData = Provider.of<CartItem1>(context);

    return DefaultTabController(
      length: listImageCategory.length,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              //  elevation: 90,
              foregroundColor: Colors.green,
              actions: [
                Container(
                  margin: EdgeInsets.only(top: 6, right: 10),
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
                            color: Colors.black,
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
                )
              ],
              title: Text(
                "Store",
                style: TextStyle(fontSize: 21.4, fontWeight: FontWeight.w700),
              ),
            ),
            body: NestedScrollView(
                //  physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      expandedHeight: 450,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
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
                                  contentPadding:
                                      EdgeInsets.only(bottom: 9, top: 9),
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Features Brands",
                                  style: TTextTheme.lightTextTheme.headlineSmall,
                                ),
                                TextButton(
                                    onPressed: () {
                                       Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Brands(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "View all",
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 80,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 80,
                                  padding: EdgeInsets.only(right: 8, left: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Image(
                                          height: 50,
                                          width: 50,
                                          image: AssetImage(
                                            TImages.adidasLogo,
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Adidas",
                                                  style: TTextTheme.lightTextTheme
                                                      .headlineSmall,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(
                                                  Icons.verified,
                                                  color: TColors.primary,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 83,
                                              child: Text(
                                                "95 Products",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      bottom: TabBar(
                        padding: EdgeInsets.all(0),
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: TColors.primary,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.black,
                        onTap: (value) {
                          setState(() {
                            listImageCategory[value]["isActiveCategory"] = true;
                            for (var i = 0; i < listImageCategory.length; i++) {
                              if (i != value) {
                                listImageCategory[i]["isActiveCategory"] = false;
                              }
                            }
                          });
                        },
                        tabs: [
                          Tab(text: listImageCategory[0]["name"]),
                          Tab(text: listImageCategory[1]["name"]),
                          Tab(text: listImageCategory[2]["name"]),
                          Tab(text: listImageCategory[3]["name"]),
                          Tab(text: listImageCategory[4]["name"]),
                          Tab(text: listImageCategory[5]["name"]),
                          Tab(text: listImageCategory[6]["name"]),
                          Tab(text: listImageCategory[7]["name"]),
                        ],
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  children: [
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  CategoryProducts(),
                  ],
                ))),
      ),
    );
  }
}
