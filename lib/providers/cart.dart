import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items =  {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingProduct) => CartItem(
          id: existingProduct.id,
          title: existingProduct.title,
          quantity: existingProduct.quantity + 1,
          price: existingProduct.price,
        ),
      );
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                title: product.title,
                quantity: 1,
                price: product.price,
              ));
    }
    notifyListeners();
  }
}
