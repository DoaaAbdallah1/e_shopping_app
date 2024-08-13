// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_element

import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final double rate;
  final double discount;
  final bool isHeart;
  final int index;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rate,
    required this.discount,
    required this.isHeart,
    required this.index,
  });
}

class GetDataFromFireStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: productsCollection.doc('productss').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(child: Text("Document does not exist"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List<Product> products = [
            Product(
                index: 0,
                isHeart: false,
                title: "${data['title_1']}",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage1,
                price: data['price_1'],
                category: "Nike",
                rate: 4.8,
                discount: 30),
            Product(
                index: 1,
                isHeart: false,
                title: "white  nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage2,
                price: 75,
                category: "Nike",
                rate: 4.8,
                discount: 23),
            Product(
                isHeart: false,
                index: 2,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage3,
                price: 75,
                category: "Clothes",
                rate: 4.8,
                discount: 30),
            Product(
                index: 3,
                isHeart: false,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage4,
                price: 75,
                category: "Nike",
                rate: 4.8,
                discount: 30),
            Product(
                index: 4,
                isHeart: false,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage5,
                price: 75,
                category: "Clothes",
                rate: 4.8,
                discount: 30),
            Product(
                index: 5,
                isHeart: false,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage6,
                price: 75,
                category: "Nike",
                rate: 4.8,
                discount: 30),
            Product(
                index: 6,
                isHeart: false,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage7,
                price: 75,
                category: "Clothes",
                rate: 4.8,
                discount: 30),
            Product(
                index: 7,
                isHeart: false,
                title: "Green nike sport shoe",
                description:
                    "The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships.The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships",
                image: TImages.productImage8,
                price: 75,
                category: "Nike",
                rate: 4.8,
                discount: 30),
          ];

          List<bool> isFav = [];

          funAddFav() {
            for (int i = 0; i < products.length; i++) {
              isFav.add(products[i].isHeart);
            }
          }

          List<int> allQuantity = [];

          
          funDefineQuentities() {
            for (var i = 0; i < products.length; i++) {
              if (true) {
                allQuantity.add(0);
              }
              //allQuentities.add(0);
            }
            
          }
          funCategories(){}
        }

        return Center(child: Text("Loading..."));
      },
    );
  }
}
