import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewWidget extends StatelessWidget {
  final List<File> images;
  const ImageViewWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        padEnds: false,
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.4),
        children: List.generate(
          images.length ?? 0,
          (index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Image.file(images[index], fit: BoxFit.cover),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
