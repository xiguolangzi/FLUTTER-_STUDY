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
        title: const Text("按钮主题"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ButtonDemo(),
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
              child: const Text("ElevatedButton")),
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
          // 按钮主题样式
          OutlinedButtonTheme(
              data: OutlinedButtonThemeData(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.purple[100]))),
              child: OutlinedButton(
                  onPressed: () {
                    print("点击 OutlinedButton");
                  },
                  onLongPress: () {
                    print("长按 OutlinedButton");
                  },
                  child: const Text("OutlinedButton"))),
          // 图标按钮
          IconButton(
            onPressed: () {
              print("IconButton");
            },
            icon: const Icon(Icons.settings),
            color: Colors.red,
            // 水波纹
            splashColor: Colors.lightBlue,
            // 高亮的颜色
            highlightColor: Colors.purple,
            // 提示文字
            tooltip: "怎么了",
          ),

          // 命名函数声明图标
          TextButton.icon(
              onPressed: () {
                print("所有按钮都可以这样引用图标");
              },
              icon: const Icon(Icons.person),
              label: const Text("文本按钮")),
          ElevatedButton.icon(
              onPressed: () {
                print("所有按钮都可以这样引用图标");
              },
              icon: const Icon(Icons.person),
              label: const Text("凸起按钮")),
          OutlinedButton.icon(
              onPressed: () {
                print("所有按钮都可以这样引用图标");
              },
              icon: const Icon(Icons.person),
              label: const Text("轮廓按钮")),
          // 按钮组 默认水平方向，内容超长已垂直方式显示
          Container(
            color: Colors.pink[100],
            width: double.infinity,
            child: ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("按钮一")),
                ElevatedButton(onPressed: () {}, child: const Text("按钮二")),
                ElevatedButton(onPressed: () {}, child: const Text("按钮三"))
              ],
            ),
          ),
          // 回退按钮
          BackButton(
            color: Colors.red,
            onPressed: () {},
          ),
          // 关闭按钮
          CloseButton(
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
