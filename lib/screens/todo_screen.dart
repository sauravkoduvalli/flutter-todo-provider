import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
