import 'dart:convert';
import 'package:flutter_application/src/models/photo.dart';
import 'package:flutter_application/src/services/base_api_service.dart';

class PhotoService extends BaseApiService {
  Future<List<Photo>> getPhotos() async {
    final response = await get('/photos');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Photo.fromJson(item)).toList();
    }
    throw Exception('사진 로드 실패');
  }

  Future<Photo> getPhoto(int id) async {
    final response = await get('/photos/$id');

    if (response.statusCode == 200) {
      return Photo.fromJson(jsonDecode(response.body));
    }
    throw Exception('사진 로드 실패');
  }
}