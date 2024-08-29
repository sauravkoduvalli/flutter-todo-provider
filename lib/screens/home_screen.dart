import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider/counter/counter_provider.dart';
import 'package:todo_provider/screens/todo_screen.dart';
import 'package:todo_provider/widgets/todo_card.dart';

class Todo {
  const Todo({
    required this.title,
    required this.readStatus,
  });
  final String title;
  final bool readStatus;
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Todo> todoList = [
    Todo(title: "title1", readStatus: true),
    Todo(title: "title2", readStatus: true),
    Todo(title: "title3", readStatus: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) {
          bool readStatusFun() {
            if (index % 2 == 0) {
              return false;
            } else {
              return true;
            }
          }

          return TodoCard(
            title: todoList[index].title,
            readStatus: todoList[index].readStatus,
            onStatusChange: (value) {
              print(value);
            },
            onTodoTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreen(title: todoList[index].title),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Add new todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
