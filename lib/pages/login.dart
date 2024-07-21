import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  void handleLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Add the login logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const Image(image: AssetImage('images/LoginImage.png')),
              Form(
                  key:
                      _formKey, // FormKey harus selalu berada di dalam Form widget, ga boleh di luar apalagi di dalam Column
                  child: Column(children: [
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(labelText: "Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "C'mon, don't be shy! What's your email?")));
                            return "Please enter your email";
                          }
                          if (!value.contains("@")) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Onii-chan, Onegaishimasu! Enter a valid email!")));
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value ?? _email;
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Onii-chan, Onegaishimasu! Enter your password!")));
                          return "Please enter your password";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value ?? _password;
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => {handleLogin(context)},
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.cyan[800])),
                          child: const Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ))
                  ])) // Add a child argument to the Form constructor
            ])));
  }
}
