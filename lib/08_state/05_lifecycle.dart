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
  // int _num = 0;
  late int _num;

  // 1.组件对象插入到元素树中
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("调用 initstate");
    // 初始化状态
    _num = 1;
  }

  // 2.当前对象依赖改变时调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("调用 didChangeDependencies");
  }

  // 3.组件配置更新时调用
  @override
  void didUpdateWidget(covariant StatefulWidgetDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("调用 didUpdateWidget");
  }

  // 4.组件对象在元素中暂时移除,切换页面时会调用
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("调用 deactivate");
  }

  // 5.组件对象在元素汇总永远移除，关闭应用时会调用
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("调用 dispose");
  }

  void _increment() {
    setState(() {
      print("setState1");
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      print("setState2");
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("调用 biuld");
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
