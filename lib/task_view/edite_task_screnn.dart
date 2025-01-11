import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'task_type_items.dart';
import 'task.dart';
import 'utility.dart';

class EditeTask extends StatefulWidget {
  const EditeTask({super.key, required this.task});
  final Task task;
  @override
  State<EditeTask> createState() => _EditeTaskState();
}

class _EditeTaskState extends State<EditeTask> {
  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  var taskBox = Hive.box<Task>('taskBox');
  TextEditingController? textEditingControllerTitle;
  TextEditingController? textEditingControllerSubTitle;
  DateTime? _time;
  int selectedItem = 0;
  bool isButtonVisibel = false;
  @override
  void initState() {
    focus1.addListener(() {
      setState(() {});
    });
    focus2.addListener(() {
      setState(() {});
    });

    textEditingControllerTitle = TextEditingController(text: widget.task.title);
    textEditingControllerSubTitle =
        TextEditingController(text: widget.task.subTitle);
    selectedItem = getTaskTypeList().indexWhere((element) {
      return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 12),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: textEditingControllerTitle,
                  focusNode: focus1,
                  decoration: InputDecoration(
                    label: Text('عنوان تسک'),
                    labelStyle: TextStyle(
                      color: focus1.hasFocus
                          ? Color(0xff19DAA3)
                          : Color.fromARGB(238, 173, 172, 172),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                          color: Color.fromARGB(238, 173, 172, 172), width: 3),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide:
                          BorderSide(color: Color(0xffE5E5E5), width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color(0xff19DAA3), width: 3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  maxLines: 2,
                  focusNode: focus2,
                  controller: textEditingControllerSubTitle,
                  decoration: InputDecoration(
                    label: Text('توضیحات تسک'),
                    labelStyle: TextStyle(
                      color: focus2.hasFocus
                          ? Color(0xff19DAA3)
                          : Color.fromARGB(238, 173, 172, 172),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                          color: Color.fromARGB(238, 173, 172, 172), width: 3),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide:
                          BorderSide(color: Color(0xffE5E5E5), width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color(0xff19DAA3), width: 3),
                    ),
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  title: 'زمان را اتخاب کنید',
                  titleStyle: TextStyle(
                      color: Color(0xff19DAA3),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  negativeButtonText: 'حذف زمان',
                  positiveButtonText: 'انتخاب زمان',
                  negativeButtonStyle: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 181, 43, 43),
                  ),
                  positiveButtonStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff19DAA3),
                  ),
                  elevation: 3.5,
                  onNegativePressed: (context) {
                    setState(() {
                      isButtonVisibel = false;
                    });
                  },
                  onPositivePressed: (context, time) {
                    _time = time;
                    setState(() {
                      isButtonVisibel = true;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = index;
                        });
                      },
                      child: getTaskTypeItem(
                        index: index,
                        selectedItem: selectedItem,
                        taskType: getTaskTypeList()[index],
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              Visibility(
                visible: isButtonVisibel,
                child: ElevatedButton(
                  onPressed: () {
                    String title = textEditingControllerTitle!.text;
                    String subTitle = textEditingControllerSubTitle!.text;
                    editeTask(title, subTitle);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(280, 30),
                    backgroundColor: Color(0xff19DAA3),
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: Text(
                    'ویرایش تسک',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  editeTask(String title, String subTitle) {
    widget.task.title = title;
    widget.task.subTitle = subTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[selectedItem];
    widget.task.save();
  }
}