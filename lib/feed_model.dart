import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FeedModel {
  String id;
  String contents;
  List<File> images;
  DateTime createdAt;

  FeedModel({
    String? id,
    required this.contents,
    required this.images,
    DateTime? createdAt,
  }) : id = id ?? Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'],
      contents: json['contents'],
      images: [],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contents': contents,
      'images': images,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
