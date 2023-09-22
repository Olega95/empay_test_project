import 'package:empay_test_project/core/router.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(AppRouter.addTask);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Tasks'),
          bottom: const PreferredSize(
            preferredSize: Size(50, 50),
            child: TabBar(
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Active',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return TabBarView(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) => ListTile(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.allTodos.length,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => ListTile(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.activeTodos.length,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => ListTile(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.completedTodos.length,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
