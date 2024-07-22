import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waming_store/pages/auth.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {super.key,
      required this.isDarkTheme,
      required this.username,
      required this.email});

  bool isDarkTheme;
  String username;
  String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleLogout() async {
    bool? confirmLogout = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Logout"),
              content: const Text("Are you sure you want to logout?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Yes"),
                )
              ]);
        });
    if (confirmLogout ?? false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
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
                          // Row dipakai untuk menampilkan lebih dari satu widget yang akan ditampilkan secara horizontal
                          children: [Icon(Icons.star), Text("Change theme")])),
                  PopupMenuItem(
                      onTap: () => handleLogout(),
                      child: const Row(
                          children: [Icon(Icons.logout), Text("Logout")]))
                ],
                color: widget.isDarkTheme ? Colors.black : Colors.white,
              )
            ],
            title: const Text("Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
              child: ListView(children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text(widget.email),
              currentAccountPicture: const CircleAvatar(
                  child: ClipOval(
                      child: Image(image: AssetImage('images/Avatar.jpg')))),
            ),
          ])),
          body: const Center(
            child: Text("Welcome to Waming sTore!"),
          ),
        ));
  }
}
