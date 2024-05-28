import 'package:flutter/material.dart';
import 'package:todo_hive/todo/data/models/main_todo_hive/main_todo_hive.dart';
import 'package:todo_hive/todo/presentation/interactions/home_page_interactions.dart';

import '../../variables/variables.dart';
import '../interactions/new_main_todo_interactions.dart';

// Add new item to main list
class AddNewTodo extends StatelessWidget {
  const AddNewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: FloatingActionButton.extended(
        label: const Text("بهم بگو چیکار کنیم؟"),
        icon: const Icon(Icons.add),
        onPressed: () {
          addNewTodo(
              todoTextEditingController.text, mainTodoIcon as MainTodoIcon);
          todoTextEditingController.clear();
          Navigator.pop(context);
        },
      ),
    );
  }
}

class MainTodoTitleTextField extends StatelessWidget {
  const MainTodoTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          onSubmitted: (value) {
            addNewTodo(todoTextEditingController.text, mainTodoIcon);
            todoTextEditingController.clear();
          },
          controller: todoTextEditingController,
          decoration: const InputDecoration(
            labelText: "بهم بگو چیکار کنیم؟",
            floatingLabelAlignment: FloatingLabelAlignment.center,
          ),
        ),
      ),
    );
  }
}

class MainTodoIconsDropDownButton extends StatefulWidget {
  const MainTodoIconsDropDownButton({super.key});

  @override
  State<MainTodoIconsDropDownButton> createState() =>
      _MainTodoIconsDropDownButtonState();
}

class _MainTodoIconsDropDownButtonState
    extends State<MainTodoIconsDropDownButton> {
  MainTodoIcon? _selectedIcon = MainTodoIcon.home;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<MainTodoIcon>(
      value: _selectedIcon,
      items: MainTodoIcon.values.map((MainTodoIcon icon) {
        return DropdownMenuItem<MainTodoIcon>(
          value: icon,
          child: getIcon(icon),
        );
      }).toList(),
      onChanged: (MainTodoIcon? value) {
        setState(() {
          _selectedIcon = value!;
          mainTodoIcon = _selectedIcon!;
        });
      },
    );
  }
}
