// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('My Order'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
        
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                        
                          
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: TColors.grey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(
                                children: [
                                    Icon(Icons.local_shipping_outlined),
                                    SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Processing",style: TextStyle(color: TColors.primary,fontSize: 13,fontWeight: FontWeight.w600),),
                                    SizedBox(height: 0),
                                    Text("01 Sep 2023",style: TTextTheme.lightTextTheme.titleMedium,),
                                  ],
                                ),
                              
                                ],
                              )
                            ,IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_sharp,size: 20,))
                              ],
                            ),
                            SizedBox(height: 8),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(
                                children: [
                                    Icon(Icons.discount_outlined),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Order",style: TTextTheme.lightTextTheme.bodySmall,),
                                  Text("CFSGHJ34",style: TTextTheme.lightTextTheme.bodyLarge)
                                ],
                                )
                                ],
                              )
                              ,
                                Row(
                                children: [
                                    Icon(Icons.date_range),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shipping Date",style: TTextTheme.lightTextTheme.bodySmall,),
                                  Text("10 Sep 2023",style: TTextTheme.lightTextTheme.bodyLarge)
                                ],
                                
                                ),
                                SizedBox(width: 40,)
                                ],
                              )
                              
                              ],
                            )
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
          )),
    );
  
  }
}