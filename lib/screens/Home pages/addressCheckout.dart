// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/screens/Home%20pages/addAddress.dart';
import 'package:flutter/material.dart';

class AddressCheckout extends StatefulWidget {
  const AddressCheckout({super.key});

  @override
  State<AddressCheckout> createState() => _AddressCheckoutState();
}

class _AddressCheckoutState extends State<AddressCheckout> {
  List<bool> isChecked = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(

            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked[index] = !isChecked[index];
                          for (var i = 0; i < isChecked.length; i++) {
                            if (i != index) {
                              isChecked[i] = false;
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: isChecked[index]
                                ? const Color.fromARGB(143, 75, 105, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: TColors.grey)),
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
                                    Text("+201030975623"),
                                  ],
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color:
                                      isChecked[index] ? Colors.black : Colors.white,
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                                "83547, Timmy convergence, south Liana, Maine, 89865, USA"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        SizedBox(height: 5,),
          ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //objectCartData.notifyListeners();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddAddress(),
                                ));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          minimumSize: const Size(double.infinity, 55),
                        ),
                        child: const Text(
                          "Add Address",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
    
        ],
      ),
    );
  }
}
