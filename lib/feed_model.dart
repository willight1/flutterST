import 'dart:io';
import 'package:uuid/uuid.dart';

class FeedModel {
  String id;
  String contents;
  List<File> images;
  DateTime createdAt;

  FeedModel({
    required this.contents,
    required this.images,
  })  : id = Uuid().v4(),
        createdAt = DateTime.now();
}