// ignore: file_names
import 'package:flutter/material.dart';
// 图片处理库 - 图片缩放
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  const ImageDetail(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        // 手势组件 GestureDetector
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: imageUrl,
            // child: Image.network(
            //   imageUrl,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // 多张图片可以缩放，且移动端可以切换图片 --组件PhotoView
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
