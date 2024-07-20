import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // Form State => Class dari flutter yang bisa ngelakuin validasi dan sebagainya.
  // 1. Bikin 1 global key buat ngehubungin semua form yang kita bikin untuk ngetrigger action" untuk form yang menggunakan key yg sama
  final _formKey = GlobalKey<FormState>();

  // 3. Inisialisasi variable buat temp value
  String _title = "";
  String _description = "";
  String _iconPath = "images/task1.png";
  bool _isImportant = false;
  bool _isComplete = false;
  double _progress = 0.0;
  DateTime _dueData = DateTime.now();
  // List pilihan buat dropdown
  final List<String> _iconPaths = [
    "images/task1.png",
    "images/task2.png",
    "images/task3.png",
  ];

  @override
  Widget build(BuildContext context) {
    // 2. Bikin formnya
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: const Text("Add new Task"),
                backgroundColor: Colors.blue),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(
                    16), // Kasih padding biar dia ga nempel ke sisi layar (Ini cara kasih padding)
                child: Form(
                    // Jangan lupa ketika kita bikin Form, kita harus masukin keynya agar terhubung dengan global key yg udah kita bikin
                    key: _formKey,
                    child: Column(// Tempat buat nerima input
                        children: [
                      // Tempat buat masukin form-field2nya kayak TextFormField, DropdownFormField, dan sebagainya
                      TextFormField(
                          decoration: const InputDecoration(labelText: "Title"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a title";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Ini sama kek onPressed, dia bakal ngejalanin action ketika form di save/dienter
                            _title = value ?? _title;
                          }),
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Description"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _description = value ?? _description;
                          }),
                      DropdownButtonFormField(
                          items: _iconPaths.map((String value) {
                            return DropdownMenuItem(
                                value: value,
                                child:
                                    Image.asset(value, width: 50, height: 50));
                          }).toList(), // List dari dropDown menu items (kita harus mapping dulu List yang diatas)
                          onChanged: (value) {
                            setState(() {
                              _iconPath = value ?? _iconPath;
                            });
                          }),
                      CheckboxListTile(
                          title: const Text("Is important"),
                          value: _isImportant,
                          onChanged: (value) {
                            setState(() {
                              _isImportant = value ?? _isImportant;
                            });
                          }),
                      SwitchListTile(
                          title: const Text("Is Complete"),
                          value: _isComplete,
                          onChanged: (value) {
                            setState(() {
                              _isComplete = value ?? _isComplete;
                            });
                          })
                    ])))));
  }
}
