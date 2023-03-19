import 'package:flutter/material.dart';

void main() => runApp(TodoList());

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [];

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter a todo item",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.add(textEditingController.text);
                  textEditingController.clear();
                });
              },
              child: Text("Add Todo"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(todos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
