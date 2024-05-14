import 'package:hive_flutter/hive_flutter.dart';

part 'sub_todo_hive.g.dart';

@HiveType(typeId: 1)
final class SubTodoHive {
  @HiveField(0)
  String subTodoTitle;

  @HiveField(1)
  bool isChecked;

  @HiveField(2)
  int todoColorValue;

  SubTodoHive(this.subTodoTitle, this.isChecked, this.todoColorValue);
}
