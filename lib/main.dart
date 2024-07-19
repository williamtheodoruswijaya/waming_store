import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sherly',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: HomePage()
    );
  }
}