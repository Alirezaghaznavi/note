import 'package:note/task-view/task-type-enum.dart';

import 'task-type.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> taskTypeList = [
    TaskType(
      title: 'کار',
      image: 'images/hard_working.png',
      taskTypeEnum: TaskTypeEnum.work,
    ),
    TaskType(
      title: 'قرار',
      image: 'images/social_frends.png',
      taskTypeEnum: TaskTypeEnum.meet,
    ),
    TaskType(
      title: 'تمرکز',
      image: 'images/meditate.png',
      taskTypeEnum: TaskTypeEnum.foucs,
    ),
    TaskType(
      title: 'ورزش',
      image: 'images/excersice.png',
      taskTypeEnum: TaskTypeEnum.excersice,
    ),
    TaskType(
      title: 'مالی',
      image: 'images/banking.png',
      taskTypeEnum: TaskTypeEnum.bank,
    ),
  ];
  return taskTypeList;
}
