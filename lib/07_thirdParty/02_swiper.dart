// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:card_swiper/card_swiper.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1.应用头部
      appBar: AppBar(
        // 1.1 左侧菜单
        leading: const Icon(Icons.menu),
        // 1.2 头部标题
        title: const Text("轮播图"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: FulluterSwiperDemo(),
      // 浮动按钮 结合scaffold使用
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Increment",
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FulluterSwiperDemo extends StatelessWidget {
  FulluterSwiperDemo({super.key});
  final List<String> imgs = [
    "images/2.0x/0.jpg",
    "images/2.0x/1.jpg",
    "images/2.0x/2.jpg",
    "images/2.0x/3.jpg",
    "images/2.0x/4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            height: 200,
            child: Swiper(
                itemCount: imgs.length,
                itemBuilder: (context, index) {
                  return Image.asset(imgs[index]);
                }),
          )
        ],
      ),
    );
  }
}
