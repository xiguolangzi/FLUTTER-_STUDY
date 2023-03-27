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
        title: const Text("网格-命名构造函数的用法"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: GridViewBuilderDemo(),
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

class GridViewBuilderDemo extends StatelessWidget {
  GridViewBuilderDemo({super.key});
  final List<dynamic> _tiles = [
    Container(
      color: Colors.blue[100],
    ),
    Container(
      color: Colors.grey[100],
    ),
    Container(
      color: Colors.red[100],
    ),
    Container(
      color: Colors.yellow[100],
    ),
    Container(
      color: Colors.green[100],
    ),
    Container(
      color: Colors.orange[100],
    ),
    Container(
      color: Colors.blue[100],
    ),
    Container(
      color: Colors.red[100],
    ),
    Container(
      color: Colors.yellow[100],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        // 指定列的宽度，列数自适应
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        // 数量itemCount 决定itemBuilder 中的index值
        itemCount: _tiles.length,
        itemBuilder: (context, index) {
          return _tiles[index];
        },
        // 反弹效果，适用移动端，不适用桌面端
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
