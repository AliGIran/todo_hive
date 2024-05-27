import 'package:flutter/material.dart';

import '../widgets/home_page_widgets.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HomePageDeleteBoxIconButton(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.list))],
        forceMaterialTransparency: true,
        title: const Text("کارهای امروز"),
        centerTitle: true,
      ),

       body:
       // const MainTodoGridView()
      const MainTodoListView()
      ,

       floatingActionButton: const GotoNewMainTodoPage(),
    );
  }
}
