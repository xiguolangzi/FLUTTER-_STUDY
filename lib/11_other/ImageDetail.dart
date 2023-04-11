// ignore: file_names
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  const ImageDetail(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
