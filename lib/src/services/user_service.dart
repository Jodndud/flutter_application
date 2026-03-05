import 'dart:convert';
import 'package:flutter_application/src/models/user_model.dart';
import 'package:flutter_application/src/services/base_api_service.dart';

class UserService extends BaseApiService {
  Future<List<User>> getUsers() async {
    final response = await get('/users');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('유저 목록을 불러오는데 실패했습니다.');
    }
  }
}
