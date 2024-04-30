import 'package:hive/hive.dart';

part 'todo_list.g.dart';

@HiveType(typeId: 1)
class TodoListHive {
  @HiveField(0)
  String todoTitle;

  @HiveField(1)
  bool isChecked;

  TodoListHive(this.todoTitle, this.isChecked);
}
