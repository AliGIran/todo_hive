import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive/todo/presentation/manager/home_page_provider.dart';

import '../widgets/home_page_widgets.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HomePageDeleteBoxIconButton(),
        actions: [

          Switch(
            value: context.watch<HomePageProvider>().homePageGridView,
            onChanged: (value) {
              context.read<HomePageProvider>().changeHomePageView();
            },
          )
        ],
        forceMaterialTransparency: true,
        title: const Text("کارهای امروز"),
        centerTitle: true,
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, HomePageProvider, child) {
          if (HomePageProvider.homePageGridView) {
            return const MainTodoGridView();
          } else {
            return const MainTodoListView();
          }
        },
      )
      // const MainTodoGridView()
      // const MainTodoListView()
      ,
      floatingActionButton: const GotoNewMainTodoPage(),
    );
  }
}
