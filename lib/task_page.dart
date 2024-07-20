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
    final task = await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskPage()));
    if(task != null){
      setState(() => tasks.add(task));
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                itemBuilder: (context, index){
                  final task = tasks[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(task.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Text(task.description, style: const TextStyle(fontSize: 16)),
                              ]
                            )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              task.isImportant ? Icon(Icons.star, color: Colors.yellow) : SizedBox(),
                              task.isComplete ? Icon(Icons.check_circle, color: Colors.green) : SizedBox(),
                            ]
                          ),
                          SizedBox(height: 8),
                          LinearProgressIndicator(value: task.progress, backgroundColor: Colors.grey, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                        ],
                      )
                    )
                  );
                }
              )
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        // floatingActionButton Harus ada onPressed ketika kita buat sebuah button
        onPressed: openAddTaskForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
