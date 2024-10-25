import 'package:flutter/material.dart';
import 'book.dart';
import 'book_item.dart';
import 'cart_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> _books = [];
  List<Book> _filteredBooks = []; // To hold the filtered list
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addBooksManually();
    _searchController.addListener(_filterBooks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addBooksManually() {
    final List<Book> loadedBooks = [
      Book(
          id: 1,
          title: 'The Great Gatsby',
          author: 'F. Scott Fitzgerald',
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1668902223840-4f29626b25c3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8VGhlJTIwR3JlYXQlMjBHYXRzYnl8ZW58MHx8MHx8fDA%3D',
          price: 10.99),
      Book(
          id: 2,
          title: '1984',
          author: 'George Orwell',
          imageUrl:
              'https://images.pexels.com/photos/12967509/pexels-photo-12967509.jpeg?auto=compress&cs=tinysrgb&w=600',
          price: 8.99),
      Book(
          id: 3,
          title: 'To Kill a Mockingbird',
          author: 'Harper Lee',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS66i6hTBkniGtDdwxyi4hA3PFm2mJ0GUIDxw&s',
          price: 12.99),
      Book(
          id: 4,
          title: 'Pride and Prejudice',
          author: 'Jane Austen',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ35HIfFXMfo7vjBWr-U42lOAmd0LSxwnIbwA&s',
          price: 9.99),
      Book(
          id: 5,
          title: 'The Catcher in the Rye',
          author: 'J.D. Salinger',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTearkVDB7LeaYqYVP-cJ4jVqivPyPpWG8ITw&s',
          price: 7.99),
      Book(
          id: 6,
          title: 'The Hobbit',
          author: 'J.R.R. Tolkien',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/The_Hobbit_trilogy_dvd_cover.jpg/220px-The_Hobbit_trilogy_dvd_cover.jpg',
          price: 14.99),
      Book(
          id: 7,
          title: 'Moby Dick',
          author: 'Herman Melville',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BZWUyOTgyMzktMjhmNi00NThkLTkxMGEtMGU0ZDEzZWQxNjNlXkEyXkFqcGc@._V1_.jpg',
          price: 13.99),
      Book(
          id: 8,
          title: 'War and Peace',
          author: 'Leo Tolstoy',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRGjoqyPkmDgczJTIhAfU44iCjyYwTduxRgA&s',
          price: 11.99),
      Book(
          id: 9,
          title: 'The Odyssey',
          author: 'Homer',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 15.99),
      Book(
          id: 10,
          title: 'Ulysses',
          author: 'James Joyce',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 18.99),
      Book(
          id: 11,
          title: 'Brave New World',
          author: 'Aldous Huxley',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 9.99),
      Book(
          id: 12,
          title: 'The Iliad',
          author: 'Homer',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 17.99),
      Book(
          id: 13,
          title: 'Crime and Punishment',
          author: 'Fyodor Dostoevsky',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 16.99),
      Book(
          id: 14,
          title: 'Anna Karenina',
          author: 'Leo Tolstoy',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 14.99),
      Book(
          id: 15,
          title: 'Frankenstein',
          author: 'Mary Shelley',
          imageUrl:
              'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_640.jpg',
          price: 6.99),
    ];

    setState(() {
      _books = loadedBooks;
      _filteredBooks = loadedBooks; // Initialize filtered list with all books
    });
  }

  void _filterBooks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBooks = _books.where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        return titleLower.contains(query) || authorLower.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4CC9FE).withOpacity(0.5),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title:
            const Text('Discover Books', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff37AFE1),
        actions: const [
          CartIcon(), // Add cart icon to home screen app bar
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // Determine the number of columns based on screen width
          int columns = (width < 600)
              ? 2
              : (width < 900)
                  ? 3
                  : 4;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for books...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xff37AFE1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _filteredBooks.isEmpty
                    ? const Center(child: Text('No books found'))
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns, // Use calculated columns
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: _filteredBooks.length,
                        itemBuilder: (ctx, i) =>
                            BookItem(book: _filteredBooks[i]),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
