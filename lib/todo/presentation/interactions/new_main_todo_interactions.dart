import 'package:flutter/material.dart';

import '../../data/models/main_todo_hive/main_todo_hive.dart';

// Map TodoAppIcon item to a flutter icon and return an icon
Icon getIcon(MainTodoIcon icon) {
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