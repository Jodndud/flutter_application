import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/models/user_model.dart';
import 'package:flutter_application/src/providers/api_providers.dart';

// 전체 유저 목록을 관리하는 컨트롤러
final userListControllerProvider =
    AsyncNotifierProvider<UserListController, List<User>>(() {
      return UserListController();
    });

class UserListController extends AsyncNotifier<List<User>> {
  @override
  FutureOr<List<User>> build() async {
    return _fetchUsers();
  }

  Future<List<User>> _fetchUsers() async {
    final userService = ref.read(userServiceProvider);
    return await userService.getUsers();
  }

  // 새로고침 기능
  Future<void> refresh() async {
    state = AsyncValue.data(await _fetchUsers());
  }
}
