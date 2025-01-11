import 'package:flutter/material.dart';
import 'package:note/task_view/task_type.dart';

Widget getTaskTypeItem({
  required TaskType taskType,
  required int index,
  required int selectedItem,
}) {
  return Container(
    margin: EdgeInsets.all(8),
    width: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: index == selectedItem
            ? Color(0xff19DAA3)
            : Color.fromARGB(230, 173, 172, 172),
        width: index == selectedItem ? 3 : 2,
      ),
      color: index == selectedItem ? Color(0xff19DAA3) : Colors.white,
    ),
    child: Column(
      children: [
        Image.asset(taskType.image),
        SizedBox(height: 5),
        Text(
          taskType.title,
          style: TextStyle(
              fontSize: index == selectedItem ? 18 : 14,
              color: index == selectedItem ? Colors.white : Colors.black),
        ),
      ],
    ),
  );
}