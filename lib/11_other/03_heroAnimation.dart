// ignore: file_names
import 'package:flutter/material.dart';
import './ImageDetail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("hero 动画"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const HeroAnimationDemo(),
    );
  }
}

class HeroAnimationDemo extends StatelessWidget {
  const HeroAnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      mainAxisSpacing: 20,
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: List.generate(20, (index) {
        String imageUrl = "https://picsum.photos/id/$index/300/400";
        // 返回手势识别 GestureDetector
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ImageDetail(imageUrl);
            }));
          },
          child: Hero(
              // 不同页面的标签
              tag: imageUrl,
              child: Image.network(imageUrl)),
        );
      }),
    );
  }
}
