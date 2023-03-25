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
        title: const Text("SingleChildScrollViewDemo"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const SingleChildScrollViewDemo(),
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

class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 验证水平滚动
        SingleChildScrollView(
          // 滚动方向
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          // 滚动的起始位置
          reverse: true,
          child: Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("按钮 1")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 2")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 3")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 4")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 5")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 6")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮 7"))
            ],
          ),
        ),
        // 垂直方向滚动
        SingleChildScrollView(
          // 滚动方向
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          // 滚动的起始位置
          reverse: true,
          // 物理弹跳效果
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                100,
                (index) =>
                    OutlinedButton(onPressed: () {}, child: Text("按钮 $index"))),
          ),
        )
      ],
    );
  }
}
