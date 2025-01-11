// ignore_for_file: deprecated_member_use, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'edite_task_screnn.dart';
import 'task.dart';

class TaskWidgte extends StatefulWidget {
  TaskWidgte({super.key, required this.task});
  Task task;
  @override
  State<TaskWidgte> createState() => _TaskWidgteState();
}

class _TaskWidgteState extends State<TaskWidgte> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getCard(),
      ],
    );
  }

  Widget getCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDone = !isDone;
          widget.task.isDone = isDone;
          widget.task.save();
        });
      },
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffE5E5E5),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 15),
                  child: MSHCheckbox(
                    size: 38,
                    value: isDone,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Color(0xff19DAA3),
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isDone = !isDone;
                        widget.task.isDone = isDone;
                        widget.task.save();
                      });
                    },
                  ),

                  // child: Checkbox(
                  //   value: isDone,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       isDone = !isDone;
                  //       widget.task.isDone = isDone;
                  //       widget.task.save();
                  //     });
                  //   },
                  // ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          widget.task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          widget.task.subTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      getButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.task.taskType.image,
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        widget.task.taskType.title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row getButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 85,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xff19DAA3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  '${widget.task.time.hour}:${getMinute(widget.task.time)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/icon_time.png',
                width: 15,
                height: 15,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditeTask(task: widget.task),
              ),
            );
          },
          child: Container(
            width: 85,
            height: 30,
            decoration: BoxDecoration(
              color: Color.fromARGB(223, 205, 255, 205),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ویرایش',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff19DAA3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/icon_edit.png',
                  width: 18,
                  height: 18,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getMinute(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return '${time.minute}';
    }
  }
}