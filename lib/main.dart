import 'package:flutter/material.dart';
import 'package:keep_book_store/splash_screen.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EBook App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(), // Ensure your home screen is set
      ),
    );
  }
}
