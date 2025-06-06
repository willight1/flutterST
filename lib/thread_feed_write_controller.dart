import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_app_sample/feed_model.dart';

class ThreadFeedWriteController extends GetxController {
  String contents = '';
  List<XFile>? selectedImages;

  void setContent(String value) {
    contents = value;
    update();
  }

  void setSelectedImages(List<XFile>? value) {
    selectedImages = value;
    update();
  }
  void save() {
  Get.back(
    result: FeedModel(
      contents: contents,
      images: selectedImages?.map<File>((e) => File(e.path)).toList() ?? [],
    ),
  );
}
}
