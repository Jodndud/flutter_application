import 'package:flutter/material.dart';
import 'package:flutter_application/app/router/router.dart';
import 'package:flutter_application/src/controllers/todo_controller.dart';
import 'package:flutter_application/src/widgets/todo_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAsync = ref.watch(todoControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push(Routes.todoAdd),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: todoAsync.when(
          data: (todos) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoItem(todo: todo);
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text('Todo list error: $error')),
        ),
      ),
    );
  }
}
