import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage(
      {super.key,
      required this.isDarkTheme,
      required this.username,
      required this.email});

  bool isDarkTheme;
  String username;
  String email;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              backgroundColor: Colors.transparent),
          body: const Text("Cart Page"),
        ));
  }
}
