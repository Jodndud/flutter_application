import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/models/photo.dart';
import 'package:flutter_application/src/providers/api_providers.dart';

final photoListControllerProvider = AsyncNotifierProvider<PhotoListController, List<Photo>>(
  PhotoListController.new,
);

class PhotoListController extends AsyncNotifier<List<Photo>> {
  @override
  Future<List<Photo>> build() async {
    final photoService = ref.watch(photoServiceProvider);
    return photoService.getPhotos();
  }
}

final photoDetailControllerProvider = AsyncNotifierProviderFamily<PhotoDetailController, Photo, int>(
  PhotoDetailController.new,
);

class PhotoDetailController extends FamilyAsyncNotifier<Photo, int> {
  @override
  Future<Photo> build(int arg) async {
    final photoService = ref.watch(photoServiceProvider);
    return photoService.getPhoto(arg);
  }
}