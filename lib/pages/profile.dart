import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(
      {super.key,
      required this.isDarkTheme,
      required this.username,
      required this.email});

  bool isDarkTheme;
  String username;
  String email;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              backgroundColor: Colors.transparent),
          body: const Text("Profile Page"),
        ));
  }
}
