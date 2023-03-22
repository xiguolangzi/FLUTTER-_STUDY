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
        title: const Text("Wrap"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: WrapDemo(),
    );
  }
}

class WrapDemo extends StatelessWidget {
  WrapDemo({super.key});
  // 定义常量 需要加 final
  final List<String> _list = ["曹超", "司马懿", "曹仁", "曹洪", "张辽", "许褚"];
  // chip 函数 只能返回 chip类型的值
  List<Chip> _weiGuo() {
    return _list
        .map((e) => Chip(
              label: Text(e),
              avatar: const CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  "魏国",
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 超出内容不会报错
        Wrap(
          // 水平方向的间距
          spacing: 8.0,
          // 垂直方向的间距
          runSpacing: 20,
          // 主轴方向的对齐方式
          alignment: WrapAlignment.spaceAround,
          children: _weiGuo(),
        ),
        // 超出内容会报错
        Row(
          children: const [
            Chip(
              label: Text("刘备"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀国"),
              ),
            ),
            Chip(
              label: Text("关羽"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀国"),
              ),
            ),
            Chip(
              label: Text("张飞"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀国"),
              ),
            ),
            Chip(
              label: Text("赵云"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "蜀国",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Chip(
              label: Text("诸葛亮"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀国"),
              ),
            )
          ],
        )
      ],
    );
  }
}
