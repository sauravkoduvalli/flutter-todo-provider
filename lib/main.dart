import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/app.dart';
import 'package:todo_provider/provider/counter/counter_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: const App()));
}
