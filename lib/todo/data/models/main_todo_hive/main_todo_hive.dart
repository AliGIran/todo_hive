import 'package:hive_flutter/hive_flutter.dart';

import '../sub_todo_hive/sub_todo_hive.dart';

part 'main_todo_hive.g.dart';

@HiveType(typeId: 0)
class MainTodoHive {
  @HiveField(0)
  String todoTitle;

  @HiveField(1)
  bool isChecked;

  @HiveField(2)
  int todoColorValue;

  @HiveField(3)
  List<SubTodoHive> subTodo;

  @HiveField(4)
  MainTodoIcon icon;

  MainTodoHive(this.todoTitle, this.isChecked, this.todoColorValue,
      this.subTodo, this.icon);
}

@HiveType(typeId: 2)
enum MainTodoIcon {
  @HiveField(0)
  home,
  @HiveField(1)
  kitchen,
  @HiveField(2)
  reading,
  @HiveField(3)
  sport,
  @HiveField(4)
  family,
  @HiveField(5)
  work,
}
