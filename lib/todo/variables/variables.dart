import 'package:flutter/cupertino.dart';

import '../data/models/main_todo_hive/main_todo_hive.dart';

  int mainTodoIndex=0,subTodoIndex=0;

final TextEditingController todoTextEditingController = TextEditingController();
final TextEditingController subTodoTextEditingController =
    TextEditingController();


MainTodoIcon? mainTodoIcon;
