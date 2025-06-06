import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_app_sample/home.dart';
import 'package:thread_app_sample/home_feed_list_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Platform.isAndroid
          ? "AIzaSyDWFOMVkv2dhLaEiXhL62M80DDYpR59rKM"
          : 'AIzaSyCfu29frdbeyOE7XWlRzg-Bf7Ns8XgKQGI',
      appId: Platform.isAndroid
          ? "1:1012631583207:android:f85d4430098f780a29a542"
          : '1:1012631583207:ios:161bb85c5837d3cb29a542',
      messagingSenderId: "1012631583207",
      projectId: "thread-sample-app-43087",
      iosBundleId: "com.example.threadAppSample",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    Get.put(HomeFeedListcontroller());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
