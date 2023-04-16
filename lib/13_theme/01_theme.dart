// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("主题"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 600.0,
      children: [
        Text(
          "Theme Exaple",
          // 引用文本主题
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "新按钮abc",
              style: Theme.of(context).textTheme.bodySmall,
            )),
        const Icon(Icons.percent),
        const Icon(Icons.settings),
        const Icon(Icons.abc_sharp),
        // 设置局部样式 - 优先于全局样式
        Theme(
            data: ThemeData(
                iconTheme: const IconThemeData(size: 60, color: Colors.green)),
            child: const Icon(Icons.settings)),
        Card(
          child: Column(
            children: const [
              // 标签 = leading + title + subtitle
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue,
                ),
                title: Text(
                  "张三",
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  "董事长",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // 分割线 Divider
              Divider(),
              ListTile(
                title: Text(
                  "电话：64182497200",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "地址：XXXXXXXXXXXXXXXXXXXXXXXXXXX",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
