import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  bool isDarkTheme;

  HomePage({super.key, required this.isDarkTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {
                    setState(() {
                      widget.isDarkTheme = !widget.isDarkTheme;
                    });
                  },
                  child: const Row(
                      children: [Icon(Icons.star), Text("Change theme")])),
              const PopupMenuItem(
                  child: Row(children: [Icon(Icons.logout), Text("Logout")]))
            ],
            color: Colors.grey[200],
          )
        ],
        title: const Text("Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: Text("Welcome to Waming sTore!"),
      ),
    );
  }
}
