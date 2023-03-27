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
        title: const Text("缓存数据库"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const SharedPreferenceDEMO(),
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

class SharedPreferenceDEMO extends StatelessWidget {
  const SharedPreferenceDEMO({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.red[50]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _incrementCount, child: const Text("递增"))
        ],
      ),
    );
  }

  void _incrementCount() async {
    try {
      // 解决问题的方法
      // SharedPreferences.setMockInitialValues({});
      // 获取保存实例
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 如果counter为空，则赋值counter = 0，
      int counter = (prefs.getInt("counter") ?? 0) + 1;
      // counter++;
      print("pressed $counter times.");
      await prefs.setInt("counter", counter);
      // print(counter);
    } catch (e) {
      print(e);
    }
  }
}
