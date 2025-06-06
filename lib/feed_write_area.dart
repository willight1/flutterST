import 'package:flutter/material.dart';

class FeedWriteArea extends StatelessWidget {
  const FeedWriteArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Text(
                        '새로운 소식이 있나요?',
                        style: TextStyle(
                          color: Color(0xff9a9a9a),
                          fontSize: 14,
                        ),
                      ),
                    ],
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
        );
  }
}