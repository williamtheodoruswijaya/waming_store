import 'package:flutter/material.dart';
import 'add_task_page.dart';

class taskPage extends StatefulWidget {
  const taskPage({super.key});

  @override
  State<taskPage> createState() => _taskPageState();
}

class _taskPageState extends State<taskPage> {
  void openAddTaskForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddTaskPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        backgroundColor: Colors.blue,
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        // floatingActionButton Harus ada onPressed ketika kita buat sebuah button
        child: const Icon(Icons.add),
        onPressed: openAddTaskForm,
      ),
    );
  }
}
