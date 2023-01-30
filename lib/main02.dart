import 'package:flutter/material.dart';

void main() {
  // 1.所有应用都需要使用MaterialApp,根组件
  runApp(MaterialApp(
    // 2.Material 布局结构的基本实现 Scaffold
    home: Scaffold(
      // 3.Scaffold-appBar:界面顶部的一个AppBar
      appBar: AppBar(title: const Text("你好 Flutter!!")),
      // 4.Scaffold-body:当前界面所显示的主要内容Widget组件
      body: const Center(
        // text组件
        child: Text(
          "你好 Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.red, fontSize: 50),
        ),
      ),
    ),
  ));
}
