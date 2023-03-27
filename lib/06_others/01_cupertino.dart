// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// 判断所属平台
import 'dart:io';

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
        title: const Text("IOS风格"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const MyBody(),
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

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget dialogBox;
    // 判断当前的平台信息是windows
    if (Platform.isWindows) {
      // 加载IOS风格的组件
      dialogBox = const CupertinoDemo();
      // 判断当前的平台信息是Android
    } else if (Platform.isAndroid) {
      // 加载安卓的组件
      dialogBox = const MaterialDemo();
    }

    return Column(
      // 平均分部
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text(
          "Material - 安卓风格",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        MaterialDemo(),
        Text(
          "cupertino - IOS风格",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        CupertinoDemo(),
      ],
    );
  }
}

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          ElevatedButton(
              onPressed: () {
                print("取消逻辑");
              },
              child: const Text("取消")),
          ElevatedButton(
              onPressed: () {
                print("确认逻辑");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                print("取消逻辑-IOS");
              },
              child: const Text("取消")),
          CupertinoDialogAction(
              onPressed: () {
                print("确认逻辑-IOS");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}
