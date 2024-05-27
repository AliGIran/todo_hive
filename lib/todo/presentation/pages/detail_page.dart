import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/todo/data/models/main_todo_hive/main_todo_hive.dart';
import 'package:todo_hive/todo/presentation/interactions/home_page_interactions.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import '../../../core/constants/hive_constants.dart';
import '../widgets/detail_page_widgets.dart';

class TodoDetailPage extends StatelessWidget {
  TodoDetailPage({super.key});

  final todos = Hive.box<MainTodoHive>(HiveConstants.mainTodoHive)
      .values
      .toList()
      .cast<MainTodoHive>();

  @override
  Widget build(BuildContext context) {
    final todo = todos[mainTodoIndex];
    final subTodos = todo.subTodo;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: Column(children: [
          detailPageAppBarTitle(todo),
          getMainTodoIcon(todo.icon)
        ]),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        )
        // backToHomePageIconButton(context)
        ,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SubTodoInputTextField(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable:
                    Hive.box<MainTodoHive>(HiveConstants.mainTodoHive)
                        .listenable(),
                builder: (BuildContext context, box, Widget? child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subTodos.length + 1,
                      itemBuilder: (context, index) {
                        if (index < subTodos.length) {
                          final subTodo = subTodos[index];

                          return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: deleteSubTodoAlertDialog(
                                        context, subTodos, todo, index),
                                  ),
                                );
                              },
                              child: subTodoListCard(todo, subTodo));
                        } else {
                          return const Gap(70);
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const DetailPageNewSubTodoFAB(),
    );
  }
}
