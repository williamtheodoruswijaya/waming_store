import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final _formKey = GlobalKey<FormState>();

String _name = "";
String _email = "";
String _password = "";

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Image(image: AssetImage('images/RegisterImage.png')),
                Form(
                    child: Container(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration:
                                    const InputDecoration(labelText: "Name"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value ?? _name;
                                }),
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
                                decoration: const InputDecoration(
                                    labelText: "Password"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value ?? _password;
                                }),
                            const SizedBox(height: 40),
                            SizedBox(
                                width: 400,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        _formKey.currentState!.save(),
                                        // Add the register logic here
                                      }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.orange[800])),
                                  child: const Text("Register",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ))
                          ],
                        )))
              ],
            )));
  }
}
