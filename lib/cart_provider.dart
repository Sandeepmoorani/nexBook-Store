import 'package:flutter/material.dart';

import 'book.dart';

class CartProvider with ChangeNotifier {
  final List<Book> _items = [];

  List<Book> get cartItems => _items;

  void addToCart(Book book) {
    if (!_items.contains(book)) {
      _items.add(book);
      notifyListeners();
    }
  }

  void removeFromCart(Book book) {
    _items.remove(book);
    notifyListeners();
  }

  bool isInCart(Book book) {
    return _items.contains(book);
  }

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price);
  }
}
