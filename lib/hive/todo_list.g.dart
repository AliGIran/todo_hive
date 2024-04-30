// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoListHiveAdapter extends TypeAdapter<TodoListHive> {
  @override
  final int typeId = 1;

  @override
  TodoListHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoListHive(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoListHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.todoTitle)
      ..writeByte(1)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
