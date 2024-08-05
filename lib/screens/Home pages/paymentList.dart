// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
    List<bool> isChecked = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                ? Color.fromARGB(143, 110, 129, 223)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: TColors.grey)),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //  border: Border.all(color: const Color.fromARGB(255, 133, 132, 132)fromARGB(255, 133, 132, 132)),
                              borderRadius: BorderRadius.circular(10),
                            //  color: Colors.grey.shade100
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  ),

                                ],
                              ),

                              Icon(
                                  Icons.check_circle,
                                  color:
                                      isChecked[index] ? Colors.black : Colors.white,
                                )

                            ],
                          )),
                      
                        
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
      
        ],
      ),
    );
  
  }
}