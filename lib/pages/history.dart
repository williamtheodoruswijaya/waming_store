import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage(
      {super.key,
      required this.isDarkTheme,
      required this.username,
      required this.email});
  bool isDarkTheme;
  String username;
  String email;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
              title: const Text("History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              backgroundColor: Colors.transparent),
          body: const Text("History Page"),
        ));
  }
}
