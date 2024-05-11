
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'todo_list.g.dart';

@HiveType(typeId: 1)
class TodoListHive {
  @HiveField(0)
  String todoTitle;

  @HiveField(1)
  bool isChecked;

   @HiveField(2)
   int colorValue;

  TodoListHive(this.todoTitle, this.isChecked, this.colorValue);

// TodoListHive(this.todoTitle, this.isChecked);
}
