import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

String _email = "";
String _password = "";

class _LoginPageState extends State<LoginPage> {
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
            child: Column(children: <Widget>[
              const Image(image: AssetImage('images/LoginImage.png')),
              Form(
                  child: Container(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        const SizedBox(height: 20),
                        TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value ?? _email;
                            }),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                              onPressed: () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    _formKey.currentState!.save(),
                                    // Add the login logic here
                                  }
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      Colors.cyan[800])),
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ))
                      ]))) // Add a child argument to the Form constructor
            ])));
  }
}
