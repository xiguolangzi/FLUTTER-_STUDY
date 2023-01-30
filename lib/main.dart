import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter"),
      ),
      // body: const MyApp(),
      // 6. 调用多个组件，用列 colunm
      body: Column(
        children: const [MyApp(), MyButton()],
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // 1.container容器组件，相当于div
      // 1.1 container 不是常量构造函数
      child: Container(
        // 2.宽高属性都是duoble类型
        width: 200,
        height: 200,
        // 3.控制容器内元素的展示方位
        alignment: Alignment.center,
        // 4.背景属性
        // 4.1 BoxDecoration不是常量构造函数
        decoration: BoxDecoration(
            // 4.1 背景颜色
            color: Colors.yellow,
            // 4.2 边框
            border: Border.all(color: Colors.red, width: 2),
            // 4.3 圆角
            borderRadius: BorderRadius.circular(30),
            // 4.4 配置阴影，boxShadow 是一个list类型，所以常量coust[]
            boxShadow: const [
              BoxShadow(
                  // 4.4.1 阴影强度
                  blurRadius: 40,
                  // 4.4.2 阴影颜色
                  color: Colors.blue)
            ],
            // 4.5 线性渐变颜色
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),
        // 5.容器内容
        child: const Text(
          "你好Flutter",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      alignment: Alignment.center,
      // margin: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      // padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      // 容器位移
      transform: Matrix4.translationValues(0, 30, 0),
      // 旋转
      // transform: Matrix4.rotationZ(0.2),
      // child后面不可以添加容器属性，否则会提示格式错误
      child: const Text(
        "按钮",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
