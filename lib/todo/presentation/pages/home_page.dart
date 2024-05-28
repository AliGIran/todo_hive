import 'package:flutter/material.dart';
import 'package:todo_hive/todo/variables/variables.dart';

import '../widgets/home_page_widgets.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HomePageDeleteBoxIconButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
          // Switch(
          //   value: lightThem,
          //   onChanged: (value) {
          //     setState(() {
          //       lightThem=value;
          //     });
          //   },)
        ],
        forceMaterialTransparency: true,
        title: const Text("کارهای امروز"),
        centerTitle: true,
      ),

       body:
       const MainTodoGridView()
      // const MainTodoListView()
      ,

       floatingActionButton: const GotoNewMainTodoPage(),
    );
  }
}
