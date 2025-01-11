// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'add_task_screen.dart';
import 'task_widget.dart';
import 'task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  TextEditingController contller = TextEditingController();
  bool isVisibelFAB = true;
  Box<Task> taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff19DAA3),
        title: Text(
          'Task App',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      floatingActionButton: Visibility(
        visible: isVisibelFAB,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTask(),
              ),
            );
          },
          backgroundColor: Color(0xff19DAA3),
          child: Image.asset('assets/images/icon_add.png'),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            setState(
              () {
                if (notification.direction == ScrollDirection.forward) {
                  isVisibelFAB = true;
                }
                if (notification.direction == ScrollDirection.reverse) {
                  isVisibelFAB = false;
                } else {}
              },
            );
            return true;
          },
          child: ValueListenableBuilder(
            builder: (context, value, child) {
              if (taskBox.isNotEmpty) {
                return ListView.builder(
                  itemCount: taskBox.values.length,
                  itemBuilder: (context, index) {
                    var task = taskBox.values.toList()[index];
                    return geItemList(task);
                  },
                );
              } else {
                return Center(child: Text('There is no task'));
              }
            },
            valueListenable: taskBox.listenable(),
          ),
        ),
      ),
    );
  }

  Widget geItemList(Task task) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          task.delete();
        },
        child: TaskWidgte(task: task));
  }
}