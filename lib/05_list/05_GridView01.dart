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
        title: const Text("网格代理 - 指定列数"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const GridViewDemo(),
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

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView(
        // 网格代理 - 指定列数
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 指定列数
            crossAxisCount: 2,
            // 主轴的间距
            mainAxisSpacing: 20,
            // 交叉轴的间距
            crossAxisSpacing: 10,
            // 子组件的宽高比
            childAspectRatio: 1.5),
        children: [
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
          ),
        ],
      ),
    );
  }
}
