import 'package:empay_test_project/core/router.dart';
import 'package:empay_test_project/core/utils/extensions.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_event.dart';
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
  void didChangeDependencies() {
    context.read<TodoBloc>().add(FetchTasks());
    super.didChangeDependencies();
  }

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
            final active =
                state.tasks.where((element) => !element.completed).toList();
            final completed =
                state.tasks.where((element) => element.completed).toList();
            return TabBarView(
              children: [
                ListView.separated(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: context.height * 0.12,
                    left: 5,
                    right: 5,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.tasks[index].title),
                    trailing: InkResponse(
                      onTap: () {
                        context
                            .read<TodoBloc>()
                            .add(CompleteTask(task: state.tasks[index]));
                      },
                      child: Icon(
                        state.tasks[index].completed
                            ? Icons.check_circle
                            : Icons.circle,
                        size: 30,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.tasks.length,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(active[index].title),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: active.length,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(completed[index].title),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: completed.length,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
