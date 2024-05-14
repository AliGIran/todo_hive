import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import '../../../core/constants/hive_constants.dart';
import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../interactions/home_page_interactions.dart';

class HomePageTextField extends StatelessWidget {
  const HomePageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onSubmitted: (value) {
          addNewTodo(todoTextEditingController.text);

          todoTextEditingController.clear();
        },
        controller: todoTextEditingController,
        decoration: const InputDecoration(
            labelText: "بهم بگو چیکار کنیم؟",
            floatingLabelAlignment: FloatingLabelAlignment.center),
      ),
    );
  }
}

// this icon button let the user to clear the whole list
class HomePageDeleteBoxIconButton extends StatelessWidget {
  const HomePageDeleteBoxIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          deleteBox(context);

          // Hive.box<TodoListHive>(todoBoxName).clear();
        },
        icon: const Icon(Icons.cleaning_services_rounded));
  }
}

class AddNewTodo extends StatelessWidget {
  const AddNewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addNewTodo(todoTextEditingController.text);
          todoTextEditingController.clear();
        });
  }
}

// the box will be deleted if user click this button
Widget acceptDeleteBox(BuildContext context) {
  return FilledButton(
      onPressed: () {
        Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).clear();

        Navigator.pop(context);
      },
      child: const Text("پاکشون کن"));
}

// the dialog box will be closed and nothing else happens
Widget declineDeleteBox(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("نه، برگرد"));
}
