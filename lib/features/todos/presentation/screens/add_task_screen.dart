import 'package:empay_test_project/features/todos/domain/entities/task.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _controller;
  bool isError = false;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.task?.title)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter task title',
                errorText: isError ? "This field can't be empty" : null,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  setState(() {
                    isError = true;
                  });
                } else {
                  if (widget.task != null) {
                    context
                        .read<TodoBloc>()
                        .add(RenameTask(id: widget.task!.id));
                  } else {
                    context
                        .read<TodoBloc>()
                        .add(CreateTask(title: _controller.text));
                  }
                  context.pop();
                }
              },
              child: const Center(
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
