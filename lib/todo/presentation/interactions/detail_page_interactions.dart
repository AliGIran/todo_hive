import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/hive_constants.dart';
import '../../../core/variables/variables.dart';
import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../../data/models/sub_todo_hive/sub_todo_hive.dart';
import '../../variables/variables.dart';

// Delete subTodo from the box and notify the listener to rebuild the list
void detailSubTodoDelete(BuildContext context, List<SubTodoHive> subTodos,
    MainTodoHive todo, int index) {
  subTodos.removeAt(index);

  Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).putAt(mainTodoIndex, todo);

  Navigator.pop(context);
}

//check the subTodo item and notify box listener by putting it into the box
void detailPageSubTodoOnChange(
    bool? value, MainTodoHive todo, SubTodoHive subTodo) {
  subTodo.isChecked = value!;
  Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).putAt(mainTodoIndex, todo);
}

// Add new subTodo to the box and notify the listener to rebuild the list
void addNewSubTodo() {

  //color of subTodo if we want to have random color for subTodos
  final subTodoColor = Color.fromRGBO(random.nextInt(200) + 56,
      random.nextInt(200) + 56, random.nextInt(200) + 56, 1);


  // Need to store subTodo color as integer in the box
  final int subColor = subTodoColor.value.toInt();

  final box = Hive.box<MainTodoHive>(HiveConstants.mainTodoHive);

  String newSubTodo = subTodoTextEditingController.text;

  final myObject = box.getAt(mainTodoIndex);

  myObject!.subTodo.add(SubTodoHive(newSubTodo, false, subColor));

  box.putAt(mainTodoIndex, myObject);

  subTodoTextEditingController.clear();
}
