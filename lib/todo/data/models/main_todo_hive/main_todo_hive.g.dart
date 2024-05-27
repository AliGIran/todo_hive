// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_todo_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainTodoHiveAdapter extends TypeAdapter<MainTodoHive> {
  @override
  final int typeId = 0;

  @override
  MainTodoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainTodoHive(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as int,
      (fields[3] as List).cast<SubTodoHive>(),
      fields[4] as MainTodoIcon,
    );
  }

  @override
  void write(BinaryWriter writer, MainTodoHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.todoTitle)
      ..writeByte(1)
      ..write(obj.isChecked)
      ..writeByte(2)
      ..write(obj.todoColorValue)
      ..writeByte(3)
      ..write(obj.subTodo)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainTodoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainTodoIconAdapter extends TypeAdapter<MainTodoIcon> {
  @override
  final int typeId = 2;

  @override
  MainTodoIcon read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MainTodoIcon.home;
      case 1:
        return MainTodoIcon.kitchen;
      case 2:
        return MainTodoIcon.reading;
      case 3:
        return MainTodoIcon.sport;
      case 4:
        return MainTodoIcon.family;
      case 5:
        return MainTodoIcon.work;
      default:
        return MainTodoIcon.home;
    }
  }

  @override
  void write(BinaryWriter writer, MainTodoIcon obj) {
    switch (obj) {
      case MainTodoIcon.home:
        writer.writeByte(0);
        break;
      case MainTodoIcon.kitchen:
        writer.writeByte(1);
        break;
      case MainTodoIcon.reading:
        writer.writeByte(2);
        break;
      case MainTodoIcon.sport:
        writer.writeByte(3);
        break;
      case MainTodoIcon.family:
        writer.writeByte(4);
        break;
      case MainTodoIcon.work:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainTodoIconAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
