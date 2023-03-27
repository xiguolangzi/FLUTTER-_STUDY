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
      body: const GridViewCountDemo(),
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

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        // 列数
        crossAxisCount: 2,
        // reverse: true,
        // 主轴方向的间距
        mainAxisSpacing: 5,
        // 交叉轴方向的间距
        crossAxisSpacing: 10,
        // 子组件的纵横比，默认是1
        childAspectRatio: 0.7,
        // padding: EdgeInsets.all(10),
        // 水平方向的padding,也可以设置垂直
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children:
            List.generate(10, (index) => Image.asset("images/2.0x/YL1.jpg")),
      ),
    );
  }
}
