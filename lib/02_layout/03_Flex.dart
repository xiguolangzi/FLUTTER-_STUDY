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
        title: const Text("Flex"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const FlexDemo(),
    );
  }
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 验证 Expanded
        Row(
          children: [
            // container 默认宽度为内容宽度，没有内容宽度默认为0
            Container(
              color: Color.fromARGB(255, 57, 69, 75),
              height: 50,
              width: 50,
            ),
            // Expanded 默认宽度为自适应屏幕宽度
            Expanded(
                child: Container(
              color: Colors.lightGreen,
              height: 50,
            ))
          ],
        ),
        Flex(
          // 主轴方向
          direction: Axis.horizontal,
          // 对齐方式
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // 排序方式
          textDirection: TextDirection.rtl,
          children: const [
            Icon(
              Icons.access_alarm,
              size: 40,
            ),
            Icon(
              Icons.person,
              size: 40,
            ),
            Icon(
              Icons.settings,
              size: 40,
            ),
            Icon(
              Icons.payment,
              size: 40,
            )
          ],
        ),
        // 弹性布局 flex
        Flex(
          // 水平方向
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.tealAccent,
                  height: 50,
                  // 宽度不生效
                  width: 50,
                )),
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.amberAccent,
                  height: 50,
                  // 宽度不生效
                  width: 50,
                ))
          ],
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.all(50),
          child: Flex(
            // 垂直方向
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.tealAccent,
                    height: 50,
                  )),
              // 空白分隔
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.amberAccent,
                    height: 50,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
