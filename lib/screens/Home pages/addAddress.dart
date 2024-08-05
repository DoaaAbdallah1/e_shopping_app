// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Add New Address'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
              
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Name', prefixIcon: Icon(Icons.person)),
                ),
      
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number', prefixIcon: Icon(Icons.phone)),
                ),
                
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  
                    Expanded(
                      child: TextField(
                                      decoration: InputDecoration(
                        labelText: 'Street', prefixIcon: Icon(Icons.edit_road)),
                                    ),
                    ),
                    SizedBox(width: 10,),
                      Expanded(
                      child: TextField(
                                      decoration: InputDecoration(
                        labelText: 'Postal Code', prefixIcon: Icon(Icons.domain_add_outlined)),
                                    ),
                    ),
                ],),
                SizedBox(
                  height: 15,
                ),
                      Row(children: [
                  
                    Expanded(
                      child: TextField(
                                      decoration: InputDecoration(
                        labelText: 'city', prefixIcon: Icon(Icons.location_city_sharp)),
                                    ),
                    ),
                    SizedBox(width: 10,),
                      Expanded(
                      child: TextField(
                                      decoration: InputDecoration(
                        labelText: 'state', prefixIcon: Icon(Icons.local_activity_outlined)),
                                    ),
                    ),
                ],),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Country',
                      prefixIcon: Icon(Icons.location_city)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save the address to Firestore
                      //...
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
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
