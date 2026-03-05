import 'package:flutter/material.dart';
import 'package:flutter_application/src/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: todo.completed ? Colors.green : Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        child: Row(
          children: [
            Checkbox(value: todo.completed, onChanged: (value) {}),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${todo.id}',
                    style: TextStyle(
                      color: todo.completed ? Colors.white : Colors.grey,
                    ),
                  ),
                  Text(
                    todo.title,
                    style: TextStyle(
                      color: todo.completed ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // 넘치는 부분을 ...으로 처리
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
