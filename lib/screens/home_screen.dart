import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider/counter/counter_provider.dart';
import 'package:todo_provider/widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            title: 'Title ${index+1}',
            readStatus: readStatusFun(),
            onStatusChange: (value) {
              print(value);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Add new todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
