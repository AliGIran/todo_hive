import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/constants/hive_constants.dart';
import '../../../core/variables/variables.dart';
import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../widgets/home_page_widgets.dart';

// Add new mainTodo to the box
addNewTodo(String newTodo, MainTodoIcon? todoIcon) {
  final todoColor = Color.fromRGBO(random.nextInt(200) + 56,
      random.nextInt(200) + 56, random.nextInt(200) + 56, 1);

  final int color = todoColor.value.toInt();

  final box = Hive.box<MainTodoHive>(HiveConstants.mainTodoHive);

  final todoListHive =
      MainTodoHive(newTodo, false, color, [], todoIcon!);

  box.add(todoListHive);
}

// Delete all mainTodos from the box
void deleteBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text("تمام موارد پاک شود؟"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [acceptDeleteBox(context), declineDeleteBox(context)],
        ),
      );
    },
  );
}

// delete the item that user log presse it
void deleteTodo(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        content: const Text("از لیست حذف شود؟"),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
              onPressed: () {
                // final box = Hive.box<TodoListHive>(todoBoxName);
                final box = Hive.box<MainTodoHive>(HiveConstants.mainTodoHive);

                box.deleteAt(index);

                Navigator.pop(context);
              },
              child: const Text("پاکش کن")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("نه، برگرد"))
        ],
      ),
    ),
  );
}

// Change checkBox value in box, draw line through title if isChecked is true  and notify listener
void homePageMainTodoOnChange(bool? value, MainTodoHive todo, int index) {
  todo.isChecked = value!;

  Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).putAt(index, todo);
}

// Turn hive enum to icon to show in UI
Icon getMainTodoIcon(MainTodoIcon icon) {
  switch (icon) {
    case MainTodoIcon.home:
      return const Icon(Icons.home);
    case MainTodoIcon.reading:
      return const Icon(Icons.local_library);
    case MainTodoIcon.sport:
      return const Icon(Icons.sports_volleyball);
    case MainTodoIcon.work:
      return const Icon(Icons.work);
    case MainTodoIcon.family:
      return const Icon((Icons.family_restroom));
    case MainTodoIcon.kitchen:
      return const Icon(Icons.soup_kitchen);

    default:
      return const Icon(Icons.error);
  }
}
