import 'package:flutter/material.dart';
import 'package:todo_hive/todo/presentation/widgets/new_main_todo_page_widgets.dart';

class NewMainTodoPage extends StatelessWidget {
  const NewMainTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("بهم بگو چیکار کنیم؟"),
        title: const Text("اضافه کردن دسته جدید"),
        centerTitle: true,

        // Back to home page
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),


      body: Column(
        children: [
          MainTodoTitleTextField(),
          MainTodoIconsDropDownButton()
        ],
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:const AddNewTodo()
    );
  }
}
