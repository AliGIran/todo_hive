import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_hive/core/constants/hive_constants.dart';
import 'package:todo_hive/todo/data/models/sub_todo_hive/sub_todo_hive.dart';
import 'package:todo_hive/todo/presentation/pages/home_page.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import 'todo/data/models/main_todo_hive/main_todo_hive.dart';
import 'todo/presentation/pages/detail_page.dart';
import 'todo/presentation/pages/new_main_todo_page.dart';

// the constant defined here not in a separated file because we only have one of them;
const String todoBoxName = "todoBoxName";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(MainTodoHiveAdapter());
  Hive.registerAdapter(SubTodoHiveAdapter());
  Hive.registerAdapter(MainTodoIconAdapter());

  // Hive
  //   ..registerAdapter(MainTodoHiveAdapter())
  //   ..registerAdapter(SubTodoHiveAdapter());

  // ..registerAdapter(TodoListHiveAdapter())

  // await Hive.openBox<TodoListHive>(todoBoxName);
  // await Hive.openBox<SubTodoHive>(HiveConstants.subTodoHive);
  await Hive.openBox<MainTodoHive>(HiveConstants.mainTodoHive);

  // await Future.wait([
  //   Hive.openBox<SubTodoHive>(HiveConstants.subTodoHive),
  //   Hive.openBox<MainTodoHive>(HiveConstants.mainTodoHive),
  // ]);

// if(Hive.isBoxOpen(HiveConstants.subTodoHive)){
//   log("sub todo box is open");
// }

  if (Hive.isBoxOpen(HiveConstants.mainTodoHive)) {
    log("main todo box is open");
  }

  // await Hive
  //   ..openBox<MainTodoHive>(HiveConstants.mainTodoHive)
  //   ..openBox<SubTodoHive>(HiveConstants.subTodoHive);

  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/todoHomePage": (context) => const TodoHomePage(),
      "/todoDetailPage": (context) => TodoDetailPage(),
      "/newMainTodoPage": (context) => const NewMainTodoPage()
    },
    debugShowCheckedModeBanner: false,
    theme:  ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green))
        ,
    home: const TodoHomePage(),
  ));
}

// class TodoHomePage extends StatelessWidget {
//   TodoHomePage({super.key});
//
//   final TextEditingController todoTextEditingController =
//       TextEditingController();
//
//   final Random random = Random();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               _deleteBox(context);
//
//               // Hive.box<TodoListHive>(todoBoxName).clear();
//             },
//             icon: const Icon(Icons.cleaning_services_rounded)),
//         forceMaterialTransparency: true,
//         title: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             onSubmitted: (value) {
//               _addNewTodo();
//             },
//             controller: todoTextEditingController,
//             decoration: const InputDecoration(
//                 labelText: "بهم بگو چیکار کنیم؟",
//                 floatingLabelAlignment: FloatingLabelAlignment.center),
//           ),
//         ),
//       ),
//
//       // Listening to Hive to update UI whenever TodolistHve updates
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: ValueListenableBuilder(
//           valueListenable: Hive.box<TodoListHive>(todoBoxName).listenable(),
//           builder: (BuildContext context, box, Widget? child) {
//             final todos = box.values.toList().cast<TodoListHive>();
//
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: box.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index < box.length) {
//                     final todo = todos[index];
//
//                     return GestureDetector(
//                       onLongPress: () {
//                         _deleteTodo(context, index);
//                       },
//                       child: Card(
//                         // color: Color.fromRGBO(
//                         //     random.nextInt(130) + 120,
//                         //     random.nextInt(130) + 120,
//                         //     random.nextInt(130) + 120,
//                         //     1),
//                         color: Color(todo.colorValue),
//                         child: CheckboxListTile(
//                           title: Text(todo.todoTitle),
//                           value: todo.isChecked,
//                           onChanged: (value) {
//                             todo.isChecked = value!;
//                             Hive.box<TodoListHive>(todoBoxName)
//                                 .putAt(index, todo); // Save changes to the box
//                           },
//                         ),
//                       ),
//                     );
//                   } else {
//                     // Render empty space below the list items
//                     // return const SizedBox(height: kFloatingActionButtonMargin + 16);
//                     return const Gap(70);
//                   }
//                 });
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             _addNewTodo();
//           }),
//     );
//   }
//
//   // The method to add new item to TodoList
//   _addNewTodo() {
//     String newTodo = todoTextEditingController.text;
//
//     final todoColor = Color.fromRGBO(random.nextInt(130) + 120,
//         random.nextInt(130) + 120, random.nextInt(130) + 120, 1);
//     final int color = todoColor.value.toInt();
//     // Color color = const Color.fromRGBO(25, 250, 250, 1);
//     TodoListHive todoListHive = TodoListHive(newTodo, false, color);
//
//     final box = Hive.box<TodoListHive>(todoBoxName);
//
//     box.add(todoListHive);
//
//     todoTextEditingController.clear();
//
//     // Just to make sure the item is added to the box
//     // log(box.length.toString());
//   }
//
//   // first open an alert box then if the user confirms, the icon will be deleted
//   void _deleteTodo(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (context) => Directionality(
//         textDirection: TextDirection.rtl,
//         child: AlertDialog(
//           content: const Text("از لیست حذف شود؟"),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             FilledButton(
//                 onPressed: () {
//                   final box = Hive.box<TodoListHive>(todoBoxName);
//
//                   box.deleteAt(index);
//
//                   Navigator.pop(context);
//                 },
//                 child: const Text("پاکش کن")),
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("نه، برگرد"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void _deleteBox(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Directionality(
//         textDirection: TextDirection.rtl,
//         child: AlertDialog(
//           title: const Text("تمام موارد پاک شود؟"),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             FilledButton(
//                 onPressed: () {
//                   Hive.box<TodoListHive>(todoBoxName).clear();
//
//                   Navigator.pop(context);
//                 },
//                 child: const Text("پاکشون کن")),
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("نه، برگرد"))
//           ],
//         ),
//       );
//     },
//   );
// }
