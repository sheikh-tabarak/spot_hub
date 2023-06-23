import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  ImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
