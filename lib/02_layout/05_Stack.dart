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
        title: const Text("层叠布局"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const StackDemo(),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // 未定位内容的排序方向
        textDirection: TextDirection.ltr,
        // 未定位内容的对齐方向
        alignment: Alignment.bottomCenter,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.itying.com/themes/itying/images/ionic4.png"),
            radius: 100,
          ),
          // positioned 必须配合 stack使用,
          Positioned(
              //  定位
              top: 100,
              //  定位
              left: 100,
              child: Container(
                color: Colors.red[100],
                child: const Text(
                  "热卖",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              )),
          const Text(
            "hello",
            style: TextStyle(fontSize: 40, color: Colors.black),
          )
        ],
      ),
    );
  }
}
