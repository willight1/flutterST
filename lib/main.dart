import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_app_sample/home.dart';
import 'package:thread_app_sample/home_feed_list_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
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
