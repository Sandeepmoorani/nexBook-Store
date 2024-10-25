class Book {
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}
