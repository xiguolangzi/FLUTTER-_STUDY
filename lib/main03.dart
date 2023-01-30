import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter"),
      ),
      // 2. 直接调用MyApp会有格式提示，需要常量构造函数const
      body: const MyApp(),
    ),
  ));
}

// 1. 创建自定义组件 无状态组件StatelessWidget,（有状态组件statefulWidget）
// 1.1 快捷键 statelessW
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // 1.2继承的抽象函数build
  Widget build(BuildContext context) {
    // 1.3直接return center组件
    return const Center(
      child: Text(
        "你好 Flutter 我是一个自定义组件",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.red, fontSize: 40),
      ),
    );
  }
}
