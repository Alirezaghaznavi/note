// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 3;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.work;
      case 1:
        return TaskTypeEnum.foucs;
      case 2:
        return TaskTypeEnum.meet;
      case 3:
        return TaskTypeEnum.bank;
      case 4:
        return TaskTypeEnum.excersice;
      default:
        return TaskTypeEnum.work;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.work:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.foucs:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.meet:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.bank:
        writer.writeByte(3);
        break;
      case TaskTypeEnum.excersice:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}