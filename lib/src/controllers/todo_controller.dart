import 'dart:async';
import 'package:flutter_application/src/models/todo.dart';
import 'package:flutter_application/src/providers/api_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoControllerProvider =
    AsyncNotifierProvider<TodoController, List<Todo>>(() {
      return TodoController();
    });

class TodoController extends AsyncNotifier<List<Todo>> {
  @override
  FutureOr<List<Todo>> build() {
    return _fetchTodos();
  }

  Future<List<Todo>> _fetchTodos() async {
    final todoService = ref.read(todoServiceProvider);
    return await todoService.fetchTodos();
  }
}
