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
            padding: EdgeInsets.all(10),
            height: 200,
            child: Swiper(
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgs[index],
                  fit: BoxFit.cover,
                );
              },
              // 自动播放
              autoplay: true,
              // 小圆点指示点
              pagination: const SwiperPagination(),
              // 左右导航
              control: const SwiperControl(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Swiper(
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgs[index],
                  fit: BoxFit.cover,
                );
              },
              // 自动播放
              autoplay: true,
              // 中间大图占宽度比
              viewportFraction: 0.7,
              // 两边图片的占比
              scale: 0.8,
              // 小圆点指示点
              pagination: const SwiperPagination(),
              // 左右导航
              control: const SwiperControl(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Swiper(
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgs[index],
                  fit: BoxFit.cover,
                );
              },
              // 自动播放
              autoplay: true,
              // 主题宽度
              itemWidth: 300,
              // 轮播图样式 - 层叠效果1
              layout: SwiperLayout.STACK,
              itemHeight: 200,
              // 轮播图样式 - 层叠效果2 需要设置主题 宽高
              // layout: SwiperLayout.TINDER,
            ),
          )
        ],
      ),
    );
  }
}
