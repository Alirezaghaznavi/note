// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note/task-view/add-task-screen.dart';
import 'package:note/task-view/home-screen.dart';
import 'package:note/task-view/task-type.dart';
import 'package:note/task-view/task-widget.dart';

import 'task-view/task-type-enum.dart';
import 'task-view/task.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(Applicayion());
}

class Applicayion extends StatefulWidget {
  const Applicayion({super.key});

  @override
  State<Applicayion> createState() => _ApplicayionState();
}

class _ApplicayionState extends State<Applicayion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
      ),
      home: HomeScreen()
    );
  }
}


