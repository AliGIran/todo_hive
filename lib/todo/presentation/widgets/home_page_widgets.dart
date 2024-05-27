import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import '../../../core/constants/hive_constants.dart';
import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../interactions/home_page_interactions.dart';

// class HomePageTextField extends StatelessWidget {
//   const HomePageTextField({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: TextField(
//           onSubmitted: (value) {
//             addNewTodo(todoTextEditingController.text,mainTodoIcon);
//             todoTextEditingController.clear();
//           },
//           controller: todoTextEditingController,
//           decoration: const InputDecoration(
//             labelText: "بهم بگو چیکار کنیم؟",
//             floatingLabelAlignment: FloatingLabelAlignment.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

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

class GotoNewMainTodoPage extends StatelessWidget {
  const GotoNewMainTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // addNewTodo(todoTextEditingController.text);
          // todoTextEditingController.clear();

          Navigator.pushNamed(context, "/newMainTodoPage");
          mainTodoIcon = MainTodoIcon.home;


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

// Listening to Hive to update UI whenever TodolistHve updates
class MainTodoGridView extends StatelessWidget {
  const MainTodoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ValueListenableBuilder(
        valueListenable:
            Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).listenable(),
        builder: (BuildContext context, box, Widget? child) {
          final todos = box.values.toList().cast<MainTodoHive>();

          return GridView.builder(
            shrinkWrap: true,
            itemCount: box.length + 1,
            itemBuilder: (context, index) {
              if (index < box.length) {
                final todo = todos[index];



                return GestureDetector(
                  onLongPress: () => deleteTodo(context, index),
                  onDoubleTap: () {
                    mainTodoIndex = index;
                    log(mainTodoIndex.toString());
                    Navigator.pushNamed(context, '/todoDetailPage');
                  },
                  child: Card(
                      color: Color(todo.todoColorValue),
                      child: Stack(
                        children: [
                          Center(child: getMainTodoIcon(todo.icon)),
                          Center(
                            child: CheckboxListTile(
                              title: Text(
                                todo.todoTitle,
                                style: TextStyle(
                                    decoration: todo.isChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              // subtitle: todo.subTodo.isNotEmpty
                              //     ? Text(todo.subTodo[0].subTodoTitle,)
                              //     : const Text(""),

                              // make a list of subTodo titles and join them with a dash
                              subtitle: todo.subTodo.isNotEmpty
                                  ? Text(
                                      todo.subTodo
                                          .map(
                                              (subTodo) => subTodo.subTodoTitle)
                                          .join(" - "),
                                      maxLines: 3,
                                    )
                                  : const Text(""),
                              value: todo.isChecked,

                              onChanged: (value) {
                                homePageMainTodoOnChange(value, todo, index);
                              },
                            ),
                          ),
                        ],
                      )),
                );
              } else {
                return const Gap(70);
              }
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        },
      ),
    );
  }
}

// Listening to Hive to update UI whenever TodolistHve updates
class MainTodoListView extends StatelessWidget {
  const MainTodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ValueListenableBuilder(
        valueListenable:
            Hive.box<MainTodoHive>(HiveConstants.mainTodoHive).listenable(),
        builder: (BuildContext context, box, Widget? child) {
          final todos = box.values.toList().cast<MainTodoHive>();

          return ListView.builder(
              shrinkWrap: true,
              itemCount: box.length + 1,
              itemBuilder: (context, index) {
                if (index < box.length) {
                  final todo = todos[index];

                  return GestureDetector(
                    onLongPress: () => deleteTodo(context, index),
                    onDoubleTap: () {
                      mainTodoIndex = index;
                      log(mainTodoIndex.toString());
                      Navigator.pushNamed(context, '/todoDetailPage');
                    },
                    child: Card(
                      color: Color(todo.todoColorValue),
                      child: CheckboxListTile(
                        secondary: getMainTodoIcon(todo.icon),
                        title: Text(
                          todo.todoTitle,
                          style: TextStyle(
                              decoration: todo.isChecked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        subtitle: todo.subTodo.isNotEmpty
                            ? Text(todo.subTodo[0].subTodoTitle)
                            : const Text(""),

                        // make a list of subTodo titles and join them with a dash
                        // subtitle: todo.subTodo.isNotEmpty
                        //     ? Text(todo.subTodo
                        //         .map((subTodo) => subTodo.subTodoTitle)
                        //         .join(" - "))
                        //     : const Text(""),
                        value: todo.isChecked,

                        onChanged: (value) {
                          homePageMainTodoOnChange(value, todo, index);
                        },
                      ),
                    ),
                  );
                } else {
                  return const Gap(70);
                }
              });
        },
      ),
    );
  }
}
