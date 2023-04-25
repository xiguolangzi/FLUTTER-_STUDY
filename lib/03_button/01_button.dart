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
        title: const Text("按钮"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ButtonDemo(),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          TextButton(
              onPressed: () {
                print("点击 textButton");
              },
              onLongPress: () {
                print("长按textButton");
              },
              onHover: (value) {
                print("虚浮textButton");
              },
              child: const Text("textButton")),
          ElevatedButton(
            onPressed: () {
              print("点击 ElevatedButton");
            },
            onLongPress: () {
              print("长按 ElevatedButton");
            },
            onHover: (value) {
              print("虚浮 ElevatedButton");
            },
            child: const Text(
              "ElevatedButton",
              // style: TextStyle(color: Colors.black),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                print("点击 OutlinedButton");
              },
              onLongPress: () {
                print("长按 OutlinedButton");
              },
              onHover: (value) {
                print("虚浮 OutlinedButton");
              },
              child: const Text("OutlinedButton")),
          OutlinedButton(
              onPressed: () {
                print("点击 OutlinedButton");
              },
              onLongPress: () {
                print("长按 OutlinedButton");
              },
              // onHover: (value) {
              //   print("虚浮 OutlinedButton");
              // },
              // 按钮样式
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      // 按下按钮时的前景色
                      return Colors.yellow;
                    }
                    // 默认状态的颜色
                    return Colors.blue[100];
                  }),
                  // 设置阴影颜色
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                  // 设置阴影宽度
                  elevation: MaterialStateProperty.all(20),
                  // 按钮边框
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey, width: 1)),
                  // 按钮形状
                  shape: MaterialStateProperty.all(
                    // 体育场形状
                    const StadiumBorder(),
                    // 圆形形状
                    // const CircleBorder()
                  ),
                  // 设置按钮大小
                  minimumSize: MaterialStateProperty.all(const Size(150, 60)),
                  // 设置水波纹颜色
                  overlayColor: MaterialStateProperty.all(Colors.purple[100])),
              child: const Text("轮廓按钮"))
        ],
      ),
    );
  }
}
