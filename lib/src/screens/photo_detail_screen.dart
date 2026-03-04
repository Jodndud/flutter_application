import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/app/router/router.dart';
import 'package:flutter_application/src/controllers/photo_controller.dart';

class PhotoDetailScreen extends ConsumerWidget {
  const PhotoDetailScreen({super.key, required this.photoId});

  final int photoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoAsync = ref.watch(photoDetailControllerProvider(photoId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(Routes.photos),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: photoAsync.when(
            data: (photo) => Column(
              children: [
                Text(photo.title),
                Image.network(
                  'https://picsum.photos/200', // 무조건 나오는 이미지 주소
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error); // 에러 시 아이콘 출력
                  },
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) =>
                Center(child: Text('Photo list error: $error')),
          ),
        ),
      ),
    );
  }
}
