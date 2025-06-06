import 'package:get/get.dart';
import 'package:thread_app_sample/feed_model.dart';

class HomeFeedListcontroller extends GetxController {
  List<FeedModel> feedList = [];

  void addFeed(FeedModel feed) {
    feedList.add(feed);
    update();
  }

  void removeFeed(String feedId) {
  feedList.removeWhere((feed) => feed.id == feedId);
  update();
}
}
