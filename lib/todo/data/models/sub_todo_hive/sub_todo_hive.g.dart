// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_todo_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTodoHiveAdapter extends TypeAdapter<SubTodoHive> {
  @override
  final int typeId = 1;

  @override
  SubTodoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTodoHive(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubTodoHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.subTodoTitle)
      ..writeByte(1)
      ..write(obj.isChecked)
      ..writeByte(2)
      ..write(obj.todoColorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTodoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
