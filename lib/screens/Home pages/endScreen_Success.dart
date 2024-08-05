// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:e_shopping_app/screens/Home%20pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessCompleteScreen extends StatefulWidget {
  const SuccessCompleteScreen({super.key});

  @override
  State<SuccessCompleteScreen> createState() => _SuccessCompleteScreenState();
}

class _SuccessCompleteScreenState extends State<SuccessCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    final CartItem1 objectCartData =
        Provider.of<CartItem1>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  TImages.successfulPaymentIcon,
                ),
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Payment Success!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'You item will be shipped soon!',
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 15, left: 15),
                child: ElevatedButton(
                  onPressed: () {
                    // Placeholder for order confirmation
                    // print('Order confirmed!');
                    setState(() {
                      objectCartData.cartItems = [];
                      objectCartData.notifyListeners();
                      for (var i = 0; i < allQuantity.length; i++) {
                        allQuantity[i] = 0;
                      }
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
