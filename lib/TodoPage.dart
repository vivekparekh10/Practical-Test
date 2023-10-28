import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Align(
            alignment: Alignment.center,
            child: Text(
              "TODO",
              style: TextStyle(color: Colors.black87, fontSize: 30),
            )),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("In development"),
      ),
    );
  }
}




