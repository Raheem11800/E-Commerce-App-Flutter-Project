import 'package:flutter/material.dart';

class CartItem {
  final String productId;
  final String productName;
  final double price;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Add item to the cart
  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  // Remove item from the cart
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Clear all items from the cart
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
