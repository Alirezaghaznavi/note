import 'package:note/task_view/task_type.dart';
import 'package:note/task_view/task_type_enum.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> taskTypeList = [
    TaskType(
      title: 'کار',
      image: 'assets/images/hard_working.png',
      taskTypeEnum: TaskTypeEnum.work,
    ),
    TaskType(
      title: 'قرار',
      image: 'assets/images/social_frends.png',
      taskTypeEnum: TaskTypeEnum.meet,
    ),
    TaskType(
      title: 'تمرکز',
      image: 'assets/images/meditate.png',
      taskTypeEnum: TaskTypeEnum.foucs,
    ),
    TaskType(
      title: 'ورزش',
      image: 'assets/images/excersice.png',
      taskTypeEnum: TaskTypeEnum.excersice,
    ),
    TaskType(
      title: 'مالی',
      image: 'assets/images/banking.png',
      taskTypeEnum: TaskTypeEnum.bank,
    ),
  ];
  return taskTypeList;
}