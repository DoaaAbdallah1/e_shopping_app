// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/screens/Home%20pages/addAddress.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<bool> isChecked = [false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Address'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => AddAddress(),));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: TColors.primary,
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
                                  color: isChecked[index]
                                      ? Colors.black
                                      : Colors.white,
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
          )),
    );
  }
}

