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
        title: const Text("组件"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      // 1. 背景
      decoration: BoxDecoration(
          // border: Border(
          //     top: BorderSide(width: 10, color: Colors.red),
          //     left: BorderSide(width: 10, color: Colors.red),
          //     right: BorderSide(width: 10, color: Colors.red),
          //     bottom: BorderSide(width: 10, color: Colors.red)),
          // 1.1 边框
          border: Border.all(width: 10.0, color: Colors.blue),
          // borderRadius: BorderRadius.all(Radius.circular(30)),
          // 1.2 圆角
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
          // 1.3 背景颜色
          color: Colors.green[100],
          // 1.4 线性渐变 ,设置渐变后，背景色失效
          gradient:
              const LinearGradient(colors: [Colors.lightBlue, Colors.white12])),
      // 2. 内容对齐方式
      alignment: Alignment.center,
      // 3. 位移
      // transform: Matrix4.translationValues(50, 0, 0),
      // 4. 旋转(XYZ轴)
      transform: Matrix4.rotationZ(0.1),
      child: const Text(
        "hello flutter ,From packages and plugins to friendly developers, find all of the resources you need to be successful with Flutter",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
