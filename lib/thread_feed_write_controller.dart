import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_app_sample/feed_model.dart';

class ThreadFeedWriteController extends GetxController {
  String contents = '';
  List<XFile>? selectedImages;
  late CollectionReference feedsCollectionRef;

  @override
  void onInit() {
    super.onInit();
    feedsCollectionRef = FirebaseFirestore.instance.collection('feeds');
  }

  void setContent(String value) {
    contents = value;
    update();
  }

  void setSelectedImages(List<XFile>? value) {
    selectedImages = value;
    update();
  }

  void save() {
    var feedModel = FeedModel(
      contents: contents,
      images: selectedImages?.map<File>((e) => File(e.path)).toList() ?? [],
    );
    feedsCollectionRef.add(feedModel.toMap());

    Get.back(result: feedModel);
  }
}
