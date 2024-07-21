import 'package:flutter/material.dart';
import 'package:waming_store/models/task.dart';
import 'add_task_page.dart';

class taskPage extends StatefulWidget {
  const taskPage({super.key});

  @override
  State<taskPage> createState() => _taskPageState();
}

class _taskPageState extends State<taskPage> {
  List<Task> tasks = [];

  void openAddTaskForm() async {
    final task = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddTaskPage()));
    if (task != null) {
      setState(() => tasks.add(task));
    }
  }

  // Ini materi Alert Dialog
  void deleteTaskConfirmation(BuildContext context, int index) async {
    bool? confirmDelete = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Delete Task"),
              content: Text("Are you sure you want to delete this task?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("Delete"))
              ]);
        });
    if (confirmDelete ?? false) {
      setState(() => tasks.removeAt(index));
      // Display snack bar
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Task deleted successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Task in Grid"),
        SizedBox(height: 20),
        Container(
            height: 250,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(task.title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(task.description,
                                        style: const TextStyle(fontSize: 16)),
                                  ])),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    task.isImportant
                                        ? Icon(Icons.star, color: Colors.yellow)
                                        : SizedBox(),
                                    task.isComplete
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green)
                                        : SizedBox(),
                                  ]),
                              SizedBox(
                                  height: 8), // Ini cara spacing di flutter
                              LinearProgressIndicator(
                                  value: task.progress,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue)),
                            ],
                          )));
                })),
        SizedBox(height: 20),
        Text("Task in Lists"),
        SizedBox(height: 20),
        ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index]; // <- Ambil dulu object tasknya
              return Card(
                  child: Padding(
                      // kasih padding
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(task.iconPath, width: 50, height: 50),
                          SizedBox(height: 10), // spacing/jarak
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task.title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text(task.description),
                              // Cara buat button bisa pake elevated button
                              ElevatedButton(
                                  onPressed: () => deleteTaskConfirmation(
                                      context,
                                      index), // <- Ini cara manggil function deleteTaskConfirmation harus pake function dalam function
                                  child: Text("Delete"))
                            ],
                          )
                        ],
                      )));
            }),
      ])),
      floatingActionButton: FloatingActionButton(
        // floatingActionButton Harus ada onPressed ketika kita buat sebuah button
        onPressed: openAddTaskForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
