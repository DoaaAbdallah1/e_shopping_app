// ignore_for_file: invalid_use_of_visible_for_testing_member, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/model/wishlist.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/ReviewsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.products, required this.index});
  final Product products;
  final int index;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentNumber = 1;
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (currentNumber != 1) {
                            setState(() {
                              currentNumber--;
                            });
                          }
                        },
                        iconSize: 18,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        currentNumber.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentNumber++;
                          });
                        },
                        iconSize: 18,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      objectCartData.addCart(
                        CartItem1(
                            quantity: currentNumber,
                            product: widget.products,
                            index: objectCartData.product.index),
                      );
                      currentNumber = 1;
                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                            // ignore: invalid_use_of_protected_member
                            objectCartData.notifyListeners();
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                        ),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                        ),
                        icon: const Icon(Icons.share),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFav[widget.index] = !isFav[widget.index];
      
                            if (isFav[widget.index] == true) {
                              objectCartData.addCartWishlist(WishlistItem(
                                  quantity: 0,
                                  product: products[widget.index],
                                  is_heart: true));
                            } else {
                              objectCartData
                                  .removeCartItemWishlist(products[widget.index]);
                            }
                            // ignore: invalid_use_of_protected_member
                            objectCartData.notifyListeners();
                            // print(objectCartData.cartItemsWishlist);
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                        ),
                        icon: isFav[widget.index]
                            ? Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red,
                                size: 23,
                              )
                            : Icon(CupertinoIcons.heart),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 290,
                  child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        currentImage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(widget.products.image);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: currentImage == index
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.products.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${widget.products.price}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: TColors.primary,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 0,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 13,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              widget.products.rate.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "(320 Reviews)",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Seller: "),
                                    TextSpan(
                                      text: "Tarqul isalm",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About Plant",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.products.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews (199)"),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.arrow_right, color: Colors.grey),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewsPage(),
                                  ));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
