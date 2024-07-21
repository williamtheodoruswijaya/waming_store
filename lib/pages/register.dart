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

void handleRegister(BuildContext context) {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    // Add the register logic here
  }
}

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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        TextFormField(
                            autocorrect: false,
                            decoration:
                                const InputDecoration(labelText: "Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Oi, Traveler, what is your name?")));
                                return "Please enter your name";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _name = value ?? _name;
                            }),
                        const SizedBox(height: 20),
                        TextFormField(
                            autocorrect: false,
                            decoration:
                                const InputDecoration(labelText: "Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Baka Yarou, please enter your email")));
                                return "Please enter your email";
                              }
                              if (!value.contains("@")) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Are you trying to be funny? Enter a valid email!")));
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value ?? _email;
                            }),
                        const SizedBox(height: 20),
                        TextFormField(
                            autocorrect: false,
                            obscureText: true,
                            decoration:
                                const InputDecoration(labelText: "Password"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Tch! You forgot to enter your password, Shine!")));
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
                              onPressed: () => {handleRegister(context)},
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      Colors.orange[800])),
                              child: const Text("Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ))
                      ],
                    ))
              ],
            )));
  }
}
