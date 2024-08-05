// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class BrandProduct extends StatefulWidget {
  const BrandProduct({super.key});

  @override
  State<BrandProduct> createState() => _BrandProductState();
}

class _BrandProductState extends State<BrandProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Brand Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Brand Product'),
            SizedBox(height: 20),
            Text('Some text about the brand product'),
          ],
        ),
      ),
    

    ));
  }
}