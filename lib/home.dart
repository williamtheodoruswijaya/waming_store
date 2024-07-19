import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> texts = ["Text 1", "Text 2", "Text 3", "Text 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
          // child: GridView.builder(
          //   shrinkWrap: true, // agar widget menyesuaikan ukuran child
          //   itemCount: texts.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, 
          //     crossAxisSpacing: 8.0, // jarak antar kolom
          //     mainAxisSpacing: 8.0, // jarak antar baris 
          //   ),
          //   itemBuilder: (BuildContext context, int index){
          //     return Container(
          //       color: Colors.blue,
          //       child: Center(child: Text(texts[index]),)
          //     );
          //   }
          // )
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: texts.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(texts[index]),
              );
          })
        )
      ) 
    );
  }
}