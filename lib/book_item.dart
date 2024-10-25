import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'book.dart';
import 'book_detail_screen.dart';
import 'cart_provider.dart';

class BookItem extends StatefulWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  final  store = FirebaseFirestore.instance.collection('books');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => BookDetailsScreen(book: widget.book),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    widget.book.imageUrl,
                    height: 150, // Adjust for size
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'by ${widget.book.author}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey[500],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${widget.book.price}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: FloatingActionButton(
                heroTag: widget.book.id,
                mini: true,
                backgroundColor: Colors.blueAccent,
                onPressed: () async{
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addToCart(widget.book);
                  await store.add({'id':widget.book.id,"title":widget.book.title,'author':widget.book.author,'imageUrl':widget.book.author,'price':widget.book.price});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added ${widget.book.title} to Cart')),
                  );
                },
                child: const Icon(Icons.add_shopping_cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
