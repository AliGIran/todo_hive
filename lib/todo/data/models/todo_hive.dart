// import 'package:hive/hive.dart';
//
// import '../../domain/entities/todo.dart';
//
// part 'todo_hive.g.dart';
//
// @HiveType(typeId: 0)
// final class MainTodoHive extends TodoEntity {
//   @override
//   @HiveField(0)
//   final String todoTitle;
//
//   @override
//   @HiveField(1)
//   final bool isChecked;
//
//   @override
//   @HiveField(2)
//   final int todoColorValue;
//
//   @HiveField(3)
//   late Box<SubTodoHive> subTodo;
//
//   MainTodoHive(this.todoTitle, this.isChecked, this.todoColorValue) {
//     // Initialize subTodo as an empty box
//     subTodo = Hive.box<SubTodoHive>('empty_sub_todo_box');
//   }
// }
//
// @HiveType(typeId: 1)
// final class SubTodoHive extends TodoEntity {
//   @override
//   @HiveField(0)
//   final String todoTitle;
//
//   @override
//   @HiveField(1)
//   final bool isChecked;
//
//   @override
//   @HiveField(2)
//   final int todoColorValue;
//
//   SubTodoHive(this.todoTitle, this.isChecked, this.todoColorValue);
// }
