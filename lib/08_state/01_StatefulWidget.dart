// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

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
        title: const Text("状态组件"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const StatefulWidgetDemo(),
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

class StatefulWidgetDemo extends StatefulWidget {
  const StatefulWidgetDemo({super.key});

  @override
  State<StatefulWidgetDemo> createState() => _StatefulWidgetDemoState();
}

class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  int _num = 0;

  void _increment() {
    setState(() {
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "数字 $_num",
              style: const TextStyle(fontSize: 20, color: Colors.red),
            )),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: _decrement,
          style: const ButtonStyle(alignment: Alignment.topCenter),
          child: const Icon(Icons.minimize),
        )
      ],
    ));
  }
}
