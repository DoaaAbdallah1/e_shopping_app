// ignore_for_file: prefer_is_empty, prefer_const_constructors, file_names

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/CheckOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 120,
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leadingWidth: 60,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: IconButton(
              onPressed: () {
                 Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        bottomSheet: Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintText: "Enter Discount Code",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: TColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  objectCartData.cartItems.length != 0
                      ? Text(
                          "\$${objectCartData.totalPrice()}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "\$0",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  objectCartData.cartItems.length != 0
                      ? Text(
                          "\$${objectCartData.totalPrice()}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "\$0",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    objectCartData.cartItems;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CheckOut(),
                    ));
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  minimumSize: const Size(double.infinity, 55),
                ),
                child: const Text(
                  "Check out",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: 410,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          objectCartData.cartItems[index].product.image,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            objectCartData.cartItems[index].product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                objectCartData.cartItems[index].product.category,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.verified,
                                size: 15,
                                color: TColors.primary,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$${objectCartData.cartItems[index].product.price}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          allQuantity[objectCartData.cartItems[index].product.index]=0;
                          setState(() {
                            objectCartData
                                .removeCartItem(objectCartData.cartItems[index]);
                                
                          });
                        },
                        icon: const Icon(
                          CupertinoIcons.trash,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (objectCartData.cartItems[index].quantity !=
                                    1) {
                                  setState(() {
                                    objectCartData.cartItems[index].quantity--;
                                    allQuantity[objectCartData.cartItems[index].product.index]--;
                                  });
                                }
                              },
                              iconSize: 18,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              objectCartData.cartItems[index].quantity.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  objectCartData.cartItems[index].quantity++;
                                  allQuantity[objectCartData.cartItems[index].product.index]++;
                                });
                              },
                              iconSize: 18,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: objectCartData.cartItems.length,
          ),
        ),
      ),
    );
  }
}
