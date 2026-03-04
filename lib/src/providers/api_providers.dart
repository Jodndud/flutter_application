import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/services/post_api_service.dart';
import 'package:flutter_application/src/services/comment_api_service.dart';
import 'package:flutter_application/src/services/photo_api_service.dart';

// PostService 인스턴스를 제공하는 Provider
final postServiceProvider = Provider<PostService>((ref) {
  return PostService();
});

// CommentService 인스턴스를 제공하는 Provider
final commentServiceProvider = Provider<CommentService>((ref) {
  return CommentService();
});

// PhotoService 인스턴스를 제공하는 Provider
final photoServiceProvider = Provider<PhotoService>((ref) {
  return PhotoService();
});
