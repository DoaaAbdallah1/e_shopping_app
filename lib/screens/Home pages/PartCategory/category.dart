// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/ProductScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 190,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          //color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: .6)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image(
                                      height: 50,
                                      width: 50,
                                      image: AssetImage(
                                        TImages.adidasLogo,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Adidas",
                                              style: TTextTheme
                                                  .lightTextTheme.headlineSmall,
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
                                        Text(
                                          "95 Products",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1))),
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1))),
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1)))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 190,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          //color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: .6)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image(
                                      height: 50,
                                      width: 50,
                                      image: AssetImage(
                                        TImages.adidasLogo,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Adidas",
                                              style: TTextTheme
                                                  .lightTextTheme.headlineSmall,
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
                                        Text(
                                          "95 Products",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1))),
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1))),
                              Container(
                                  height: 70,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //border: Border.all(),
                                      color: Colors.grey.shade200),
                                  child: Image(
                                      image: AssetImage(TImages.productImage1)))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You might like",
                          style: TTextTheme.lightTextTheme.headlineSmall,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View all",
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 4, right: 4, top: 15, bottom: 20),
                        width: double.infinity,
                        //height: 5000,
                        child: GridView.builder(
                          itemCount: objectCartData.cartItemsWishlist.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 280,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductScreen(
                                            products: objectCartData
                                                .cartItemsWishlist[index].product,
                                            index: objectCartData
                                                .cartItemsWishlist[index]
                                                .product
                                                .index),
                                      ));
                                  objectCartData.notifyListeners();
                                });
                              },
                              child: Column(
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                padding: EdgeInsets.only(top: 8),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        250, 250, 250, 0.92),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(20))),
                                                child: Image.asset(
                                                  objectCartData
                                                      .cartItemsWishlist[index]
                                                      .product
                                                      .image,
                                                  width: 160,
                                                  height: 160,
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.only(left: 7),
                                                child: Text(
                                                  objectCartData
                                                      .cartItemsWishlist[index]
                                                      .product
                                                      .title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                  ),
                                                ),
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
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7, bottom: 10),
                                                    //   padding: EdgeInsets.only(right: 8, left: 8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      "\$ ${objectCartData.cartItemsWishlist[index].product.price}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              //padding: EdgeInsets.all(),
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      153, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(30)),
                                              width: 35,
                                              height: 35,
                                              margin: EdgeInsets.only(
                                                  right: 13, top: 13),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isFav[index] = !isFav[index];
      
                                                    if (isFav[index] == false) {
                                                      objectCartData
                                                          .removeCartItemWishlist(
                                                              products[index]);
                                                    }
      
                                                    objectCartData
                                                        .notifyListeners();
                                                  });
                                                },
                                                child: const Icon(
                                                  CupertinoIcons.heart_fill,
                                                  color: Colors.red,
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
                                              margin: EdgeInsets.only(
                                                  right: 0, bottom: 0),
                                              decoration: BoxDecoration(
                                                  color: allQuantity[objectCartData
                                                              .cartItemsWishlist[
                                                                  index]
                                                              .product
                                                              .index] >
                                                          0
                                                      ? TColors.primary
                                                      : Colors.black,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15))),
                                              child: allQuantity[objectCartData
                                                          .cartItemsWishlist[
                                                              index]
                                                          .product
                                                          .index] >
                                                      0
                                                  ? Center(
                                                      child: Text(
                                                        "${allQuantity[objectCartData.cartItemsWishlist[index].product.index]}",
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
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 20),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        185, 255, 235, 59),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5))),
                                                child:
                                                    Center(child: Text("78%"))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
