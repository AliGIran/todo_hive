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

  MainTodoHive(
      this.todoTitle, this.isChecked, this.todoColorValue, this.subTodo);

// MainTodoHive(this.todoTitle, this.isChecked, this.todoColorValue) {
//   // Initialize subTodo as an empty box
//   subTodo = Hive.box<SubTodoHive>('empty_sub_todo_box');
// }
}

// class SubTodo {
//   String subTodoTitle;
//
//   bool isChecked;
//
//   int subTodoColor;
//
//   SubTodo(this.subTodoTitle, this.isChecked, this.subTodoColor);
// }
