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
    );
  }

  @override
  void write(BinaryWriter writer, MainTodoHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.todoTitle)
      ..writeByte(1)
      ..write(obj.isChecked)
      ..writeByte(2)
      ..write(obj.todoColorValue)
      ..writeByte(3)
      ..write(obj.subTodo);
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
