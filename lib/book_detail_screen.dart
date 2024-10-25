import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book.dart';
import 'cart_icon.dart';
import 'cart_provider.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isInCart(book);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.blueAccent,
        actions: const [
          CartIcon(), // Add the cart icon to the app bar
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              book.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.contain
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'by ${book.author}',
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${book.price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (isInCart) {
                  cartProvider.removeFromCart(book);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('${book.title} removed from the cart')),
                  );
                } else {
                  cartProvider.addToCart(book);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${book.title} added to the cart')),
                  );
                }
              },
              icon: Icon(isInCart
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart),
              label: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isInCart ? Colors.redAccent : Colors.blueAccent,
              ),
            ),
            const Spacer(),
            const Text(
              'Description of the book will go here...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
