import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  // 1. Form의 상태를 관리할 '열쇠'가 필요합니다.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Add')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 2. 입력창들을 Form으로 감쌉니다.
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('할 일'),
              // 3. TextField 대신 TextFormField 사용
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '제목을 입력하세요',
                ),
                // 4. 검증 로직 추가 (value는 입력된 값)
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '필수 입력 항목입니다.'; // 경고 문구
                  }
                  return null; // 문제 없으면 null 반환
                },
              ),
              const SizedBox(height: 16),
              const Text('설명'),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '상세 내용을 적어주세요',
                ),
                // 설명은 필수가 아니면 validator를 안 써도 됩니다.
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // 5. 버튼 클릭 시 전체 검증 실행!
                  if (_formKey.currentState!.validate()) {
                    // 모든 validator가 null을 반환했을 때만 여기로 들어옴
                  }
                },
                child: const Text('저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
