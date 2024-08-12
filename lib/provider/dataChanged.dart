// ignore_for_file: prefer_is_empty, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shopping_app/model/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:e_shopping_app/model/product.dart';

class CartItem1 with ChangeNotifier {
  int quantity;
  Product product;
  int index;

  CartItem1({
    required this.quantity,
    required this.product,
    required this.index,
  });
  String imgURL = "https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg";
  List<CartItem1> cartItems = [];

  addCart(CartItem1 c) {
    int counter = 0;
    for (var i = 0; i < cartItems.length; i++) {
      if (c.product == cartItems[i].product) {
        c.quantity += cartItems[i].quantity;
        cartItems[i].quantity = c.quantity;
        allQuantity[c.product.index] = cartItems[i].quantity;
      } else {
        counter++;
      }
    }
    if (counter == cartItems.length) {
      cartItems.add(c);
      allQuantity[c.product.index] = c.quantity;
    }
    if (cartItems.length == 0) {
      cartItems.add(c);
      allQuantity[c.product.index] = c.quantity;
    }
    notifyListeners();
  }

  void removeCartItem(c) {
    for (var i = 0; i < cartItems.length; i++) {
      if (c.product == cartItems[i].product) {
        cartItems.remove(cartItems[i]);
        allQuantity[i] = 0;
      }
    }
    notifyListeners();
  }

  int totalQuantityFun() {
    int total = 0;
    for (var i = 0; i < cartItems.length; i++) {
      total += cartItems[i].quantity;
    }

    // notifyListeners();
    return total;
  }

  double totalPrice() {
    double total = 0;
    for (var i = 0; i < cartItems.length; i++) {
      total += (cartItems[i].quantity * cartItems[i].product.price);
    }

    // notifyListeners();
    return total;
  }

  List<WishlistItem> cartItemsWishlist = [];
  List<bool> isFavorites = [];
  addCartWishlist(WishlistItem c) {
    cartItemsWishlist.add(c);
    isFavorites.add(true);
    //notifyListeners();
  }

  removeCartItemWishlist(c) {
    for (var i = 0; i < cartItemsWishlist.length; i++) {
      if (c == cartItemsWishlist[i].product) {
        cartItemsWishlist.remove(cartItemsWishlist[i]);
        isFavorites.removeAt(i);
      }
    }
//    notifyListeners();
  }

}
