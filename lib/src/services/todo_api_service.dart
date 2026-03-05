import 'dart:convert';
import 'package:flutter_application/src/models/todo.dart';
import 'package:flutter_application/src/services/base_api_service.dart';

class TodoService extends BaseApiService {
  Future<List<Todo>> fetchTodos() async {
    final response = await get('/todos');
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Todo.fromJson(item)).toList();
    }
    throw Exception('Todo 로드 실패');
  }
}
