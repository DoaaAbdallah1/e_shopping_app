// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, prefer_is_empty, file_names

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/addressCheckout.dart';
import 'package:e_shopping_app/screens/Home%20pages/endScreen_Success.dart';
import 'package:e_shopping_app/screens/Home%20pages/paymentList.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<bool> isChecked = [false, false, false, false, false, false, false];


  showModel(int change) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.only(right: 7, left: 7, top: 10),
            height: 320,
            color: Colors.white,
            child:change==0?PaymentList(): AddressCheckout());
      },
    );
  }

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
            "Order Review",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leadingWidth: 60,
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                objectCartData.notifyListeners();
              });
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
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
                              child: Image.asset(
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
                                      objectCartData
                                          .cartItems[index].product.category,
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
                                allQuantity[objectCartData
                                    .cartItems[index].product.index] = 0;
                                setState(() {
                                  objectCartData.removeCartItem(
                                      objectCartData.cartItems[index]);
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
                                      if (objectCartData
                                              .cartItems[index].quantity !=
                                          1) {
                                        setState(() {
                                          objectCartData
                                              .cartItems[index].quantity--;
                                          allQuantity[objectCartData
                                              .cartItems[index]
                                              .product
                                              .index]--;
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
                                    objectCartData.cartItems[index].quantity
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        objectCartData
                                            .cartItems[index].quantity++;
                                        allQuantity[objectCartData
                                            .cartItems[index].product.index]++;
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: objectCartData.cartItems.length,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  //  height: 650,
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
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            //  border: Border.all(color: const Color.fromARGB(255, 133, 132, 132)fromARGB(255, 133, 132, 132)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100),
                        child: Column(
                          children: [
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: TTextTheme.lightTextTheme.titleLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                  showModel(0);
                              },
                              child: Text("Change",
                                  style: TextStyle(fontSize: 14)),
                            )
                          ]),
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //  border: Border.all(color: const Color.fromARGB(255, 133, 132, 132)fromARGB(255, 133, 132, 132)),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(TImages.paypal),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "PayPal",
                                style: TTextTheme.lightTextTheme.bodyLarge,
                              )
                            ],
                          )),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shopping Address",
                              style: TTextTheme.lightTextTheme.titleLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                showModel(1);
                              },
                              child: Text("Change",
                                  style: TextStyle(fontSize: 14)),
                            )
                          ]),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            //  border: Border.all(color: const Color.fromARGB(255, 133, 132, 132)fromARGB(255, 133, 132, 132)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Doaa Abdalla"),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("+201030975623"),
                                      ],
                                    ),
                                  ],
                                ),
                                // Icon(
                                //   Icons.check_circle,
                                //   color:  Gr,
                                // )
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_city),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 270,
                                  child: Text(
                                      "83547, Timmy convergence, south Liana, Maine, 89865, USA"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            objectCartData.notifyListeners();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SuccessCompleteScreen(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
