import 'package:flutter/material.dart';

import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../../data/models/sub_todo_hive/sub_todo_hive.dart';
import '../../variables/variables.dart';
import '../interactions/detail_page_interactions.dart';

// A text field to get new subTodo title from user
class SubTodoInputTextField extends StatelessWidget {
  const SubTodoInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        onSubmitted: (value) => addNewSubTodo(),
        controller: subTodoTextEditingController,
        decoration: const InputDecoration(),
      ),
    );
  }
}

// FAB for user to add new subTodo to the box and notify the list builder
class DetailPageNewSubTodoFAB extends StatelessWidget {
  const DetailPageNewSubTodoFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // Add new subTodo to box and notify the listener to rebuild the list
        addNewSubTodo();
      },
    );
  }
}

// TodoTitle shown in appbar as a title
Widget detailPageAppBarTitle(MainTodoHive todo) {
  return Text(
    todo.todoTitle,
  );
}

// Take user to home page from detail page
Widget backToHomePageIconButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      mainTodoIndex = 0;
      Navigator.pop(context);
      // log(mainTodoIndex.toString());
    },
  );
}

// If clicked, delete the selected item from box
Widget acceptSubTodoDeleteButton(BuildContext context,
    List<SubTodoHive> subTodos, MainTodoHive todo, int index) {
  return FilledButton(
      onPressed: () {
        detailSubTodoDelete(context, subTodos, todo, index);
      },
      child: const Text("پاکش کن"));
}

Widget declineSubTodoDelete(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("نه، برگرد"));
}

// Show dialog before deleting to make sure it was not a mistake
Widget deleteSubTodoAlertDialog(BuildContext context,
    List<SubTodoHive> subTodos, MainTodoHive todo, int index) {
  return AlertDialog(
    content: const Text("از لیست حذف شود؟"),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      acceptSubTodoDeleteButton(context, subTodos, todo, index),
      declineSubTodoDelete(context),
    ],
  );
}

//List of subTodos shown in detailPage as cards
Widget subTodoListCard(MainTodoHive todo, SubTodoHive subTodo) {
  return Card(
    // For better UX we use mainTodo color for it's subTodos
    color: Color(todo.todoColorValue),
    child: CheckboxListTile(
      title: Text(
        subTodo.subTodoTitle,
        style: TextStyle(
            decoration: subTodo.isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      value: subTodo.isChecked,
      onChanged: (bool? value) {
        detailPageSubTodoOnChange(value, todo, subTodo);
      },
    ),
  );
}
