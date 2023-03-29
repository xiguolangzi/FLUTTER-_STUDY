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
        title: const Text("跨区状态管理"),
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
    return SharDataWidgetDemo(
        num: _num,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              // child: Text(
              //   "数字 $_num",
              //   style: const TextStyle(fontSize: 20, color: Colors.red),
              // )
              child: MyCounter(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _decrement,
              style: const ButtonStyle(alignment: Alignment.topCenter),
              child: const Icon(Icons.minimize),
            )
          ],
        )));
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  @override
  Widget build(BuildContext context) {
    // 引用静态函数可以直接通过.来引用
    return Text(SharDataWidgetDemo.of(context)!.num.toString());
  }
}

class SharDataWidgetDemo extends InheritedWidget {
  // 声明数据，并添加到 SharDataWidgetDemo 命名构造函数传参
  final int num;

  const SharDataWidgetDemo({super.key, required this.child, required this.num})
      : super(child: child);

  final Widget child;

  static SharDataWidgetDemo? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharDataWidgetDemo>();
  }

  @override
  bool updateShouldNotify(SharDataWidgetDemo oldWidget) {
    return true;
  }
}
