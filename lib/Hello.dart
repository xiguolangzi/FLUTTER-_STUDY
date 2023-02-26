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
        title: const Text("首页"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: Column(
        children: const [HelloFlutter(), TextDemo()],
      ),
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "你好 flutter 轻轻的我走了，正如我轻轻的来，我挥挥衣袖，作别西边的云彩",
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          // 中划线
          decoration: TextDecoration.lineThrough,
          // 中划线颜色
          decorationColor: Colors.blue),
      // 文本对齐方式
      textAlign: TextAlign.left,
      // 文本显示最大行数
      maxLines: 2,
      // 文本溢出省略号显示
      overflow: TextOverflow.ellipsis,
    );
  }
}
