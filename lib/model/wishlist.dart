// ignore_for_file: non_constant_identifier_names

import 'package:e_shopping_app/model/product.dart';

class WishlistItem {
  int quantity;
  Product product;
  bool is_heart;

  WishlistItem({
    required this.quantity,
    required this.product,
    required this.is_heart,
  });
}

List<WishlistItem> cartItemsWishlist = [];
addCartWishlist(WishlistItem c) {
  
    cartItemsWishlist.add(c);
  
}

removeCartItemWishlist(c) {
  for (var i = 0; i < cartItemsWishlist.length; i++) {
    if (c.product == cartItemsWishlist[i].product) {
      cartItemsWishlist.remove(cartItemsWishlist[i]);
    }
  }
}

totalQuantity() {
  int total = 0;
  for (var i = 0; i < cartItemsWishlist.length; i++) {
    total += cartItemsWishlist[i].quantity;
  }
  return total;
}
