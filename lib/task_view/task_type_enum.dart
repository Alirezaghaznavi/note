import 'package:hive_flutter/hive_flutter.dart';

part 'task_type_enum.g.dart';

@HiveType(typeId: 3)
enum TaskTypeEnum {
  @HiveField(0)
  work,
  @HiveField(1)
  foucs,
  @HiveField(2)
  meet,
  @HiveField(3)
  bank,
  @HiveField(4)
  excersice,
}