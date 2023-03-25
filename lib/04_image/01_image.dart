// ignore: file_names
import 'package:flutter/material.dart';

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
        title: const Text("图片"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ImageDemo(),
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

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 加载本地图片
        Image.asset(
          "images/2.0x/YL1.jpg",
          width: 200,
          height: 300,
          // 填充方式 fit
          fit: BoxFit.cover,
        ),
        // 加载网络图片
        Image.network(
          "https://www.itying.com/themes/itying/images/ionic4.png",
          width: 200,
          height: 300,
          // fit: BoxFit.cover,
          repeat: ImageRepeat.repeat,
          // 北京颜色混合的效果
          colorBlendMode: BlendMode.colorDodge,
          color: Colors.green,
        )
      ],
    );
  }
}
