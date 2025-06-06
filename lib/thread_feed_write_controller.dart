import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_app_sample/feed_model.dart';

class ThreadFeedWriteController extends GetxController {
  ThreadFeedWriteController({this.editFeedModel});
  final TextEditingController contentsTextController = TextEditingController();
  final FeedModel? editFeedModel;
  String contents = '';
  List<XFile>? selectedImages;
  late CollectionReference feedsCollectionRef;

  @override
  void onInit() {
    super.onInit();
    feedsCollectionRef = FirebaseFirestore.instance.collection('feeds');
    if (editFeedModel != null) {
      contents = editFeedModel!.contents;
      contentsTextController.text = contents;
    }
  }

  void setContent(String value) {
    contents = value;
    update();
  }

  void setSelectedImages(List<XFile>? value) {
    selectedImages = value;
    update();
  }

  void save() async {
    var feedModel = FeedModel(
      id: editFeedModel?.id,
      contents: contents,
      images: selectedImages?.map<File>((e) => File(e.path)).toList() ?? [],
    );
    if (editFeedModel != null) {
      var doc = await feedsCollectionRef
          .where('id', isEqualTo: feedModel.id)
          .get();
      feedsCollectionRef.doc(doc.docs.first.id).update(feedModel.toMap());
    } else {
      feedsCollectionRef.add(feedModel.toMap());
    }

    Get.back(result: feedModel);
  }
}
