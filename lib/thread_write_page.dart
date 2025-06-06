import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_app_sample/image_view_widget.dart';
import 'package:thread_app_sample/thread_feed_write_controller.dart';

class ThreadWritePage extends StatelessWidget {
  const ThreadWritePage({super.key});
  Future<void> getImagePickerData() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    Get.find<ThreadFeedWriteController>().setSelectedImages(images);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          behavior: HitTestBehavior.translucent,
          child: Center(child: Text('취소', style: TextStyle(fontSize: 20))),
        ),
        backgroundColor: Colors.transparent,
        title: Text('새로운 스레드'),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile_image.png', width: 50),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Kimsungduck',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff262626),
                        ),
                      ),
                      TextField(
                        controller: Get.find<ThreadFeedWriteController>()
                            .contentsTextController,
                        cursorHeight: 16,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: '새로운 소식이 있나요?',
                          hintStyle: TextStyle(
                            color: Color(0xff9a9a9a),
                            fontSize: 14,
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          Get.find<ThreadFeedWriteController>().setContent(
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: GetBuilder<ThreadFeedWriteController>(
                    builder: (controller) {
                      if (controller.selectedImages == null ||
                          (controller.selectedImages?.isEmpty ?? true)) {
                        return Container();
                      }
                      return ImageViewWidget(
                        images:
                            controller.selectedImages
                                ?.map<File>((e) => File(e.path))
                                .toList() ??
                            [],
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 60),
                GestureDetector(
                  onTap: () {
                    getImagePickerData();
                  },
                  child: Image.asset('assets/images/photo_icon.png', width: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: Image.asset('assets/images/photo_icon.png', width: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: Image.asset('assets/images/gif_icon.png', width: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: Image.asset('assets/images/mic_icon.png', width: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: Image.asset('assets/images/align_icon.png', width: 30),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '누구에게나 답글 및 인용 허용',
                style: TextStyle(color: Color(0xff9a9a9a)),
              ),
            ),
            GetBuilder<ThreadFeedWriteController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    if (controller.contents != '') {
                      Get.find<ThreadFeedWriteController>().save();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: controller.contents != ''
                          ? Colors.black
                          : Color(0xff9a9a9a),
                    ),
                    child: Text('게시'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
