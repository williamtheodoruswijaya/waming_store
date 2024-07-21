import 'package:flutter/material.dart';
import 'package:waming_store/pages/login.dart';
import 'package:waming_store/pages/register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void navigateToLogin(BuildContext context) async {
    // Navigate to the login page
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void navigateToRegister(BuildContext context) async {
    // Navigate to the register page
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 252, 255),
        body: Center(
            child: Column(children: [
          const Padding(padding: EdgeInsets.all(20)),
          const Image(image: AssetImage('images/Logo.png')),
          SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => navigateToLogin(context),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.cyanAccent[800])),
                  child: const Text("Login"))),
          const SizedBox(height: 20),
          SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => navigateToRegister(context),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.cyan[800])),
                child: const Text("Register",
                    style: TextStyle(color: Colors.white)),
              )),
        ])));
  }
}
