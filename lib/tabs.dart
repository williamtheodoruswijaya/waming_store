import 'package:flutter/material.dart';
import 'package:waming_store/pages/auth.dart';
import 'package:waming_store/pages/cart.dart';
import 'package:waming_store/pages/history.dart';
import 'package:waming_store/pages/home.dart';
import 'package:waming_store/pages/profile.dart';

class TabsPage extends StatefulWidget {
  TabsPage(
      {super.key,
      required this.isDarkTheme,
      required this.username,
      required this.email});

  bool isDarkTheme;
  String username;
  String email;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
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

  // This keep track of the selected page
  int _selectedPageIndex = 0;

  void _onThemeChanged(bool isDarkTheme) {
    setState(() {
      widget.isDarkTheme = isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPages = [
      HomePage(
          isDarkTheme: widget.isDarkTheme,
          username: widget.username,
          email: widget.email,
          onThemeChanged: _onThemeChanged),
      CartPage(
          isDarkTheme: widget.isDarkTheme,
          username: widget.username,
          email: widget.email),
      HistoryPage(
          isDarkTheme: widget.isDarkTheme,
          username: widget.username,
          email: widget.email),
      ProfilePage(
          isDarkTheme: widget.isDarkTheme,
          username: widget.username,
          email: widget.email)
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedPageIndex = index;
      });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedPageIndex,
                onTap: _onItemTapped,
                unselectedItemColor: widget.isDarkTheme
                    ? Colors.white
                    : Color.fromARGB(255, 72, 72, 72),
                selectedItemColor:
                    widget.isDarkTheme ? Colors.cyanAccent : Colors.blue,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: "Home",
                      backgroundColor:
                          widget.isDarkTheme ? Colors.black : Colors.white),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.shopping_cart),
                      label: "Cart",
                      backgroundColor:
                          widget.isDarkTheme ? Colors.black : Colors.white),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.history),
                      label: "History",
                      backgroundColor:
                          widget.isDarkTheme ? Colors.black : Colors.white),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: "Profile",
                      backgroundColor:
                          widget.isDarkTheme ? Colors.black : Colors.white),
                ]),
            body: _listPages[_selectedPageIndex]));
  }
}
