// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Productt {
//   final String title;
//   final String description;
//   final String image;
//   final double price;
//   final String category;
//   final double rate;
//   final double discount;
//   final bool isHeart;
//   final int index;

//   Productt({
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.price,
//     required this.category,
//     required this.rate,
//     required this.discount,
//     required this.isHeart,
//     required this.index,
//   });

//   // Factory method to create a Product from Firestore data
//   factory Productt.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map<String, dynamic>;
//     return Productt(
//       title: data['title'],
//       description: data['description'],
//       image: data['image'],
//       price: (data['price']).toDouble(),
//       category: data['category'],
//       rate: (data['rate']).toDouble(),
//       discount: (data['discount']).toDouble(),
//       isHeart: data['isHeart'] ?? false,
//       index: data['index'],
//     );
//   }
// }

// class ProductProvider extends ChangeNotifier {
//   List<Productt> productsss = [];

//   ProductProvider() {
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     try {
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection('products').get();

//       productsss = querySnapshot.docs
//           .map((doc) => Productt.fromFirestore(doc))
//           .toList();

//       // Initialize favorite and quantity lists
//       initializeFavAndQuantities();

//       notifyListeners();
//     } catch (e) {
//       print('Error fetching products: $e');
//     }
//   }

//   List<bool> isFav = [];
//   List<int> allQuantity = [];

//   void initializeFavAndQuantities() {
//     isFav = List<bool>.filled(productsss.length, false);
//     allQuantity = List<int>.filled(productsss.length, 0);

//     for (int i = 0; i < productsss.length; i++) {
//       isFav[i] = productsss[i].isHeart;
//     }
//   }

//   void toggleFavorite(int index) {
//     isFav[index] = !isFav[index];
//     notifyListeners();
//   }

//   void updateQuantity(int index, int quantity) {
//     allQuantity[index] = quantity;
//     notifyListeners();
//   }
// }
