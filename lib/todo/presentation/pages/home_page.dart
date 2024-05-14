import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/core/constants/hive_constants.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import '../../data/models/main_todo_hive/main_todo_hive.dart';
import '../interactions/home_page_interactions.dart';
import '../widgets/home_page_widgets.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HomePageDeleteBoxIconButton(),
        forceMaterialTransparency: true,
        title: const HomePageTextField(),
      ),

      // Listening to Hive to update UI whenever TodolistHve updates
      body: Directionality(
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
      ),

      floatingActionButton: const AddNewTodo(),
    );
  }
}
