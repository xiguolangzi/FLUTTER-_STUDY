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
          ElevatedButton(onPressed: _incrementCount, child: const Text("递增")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _decrementCount, child: const Text("递减")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _removeCount, child: const Text("删除数据")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _addMyContent, child: const Text("设置字符串")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _getMyContent, child: const Text("获取字符转")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _clearContent, child: const Text("清空")),
        ],
      ),
    );
  }

  void _incrementCount() async {
    try {
      // 解决初始化问题的方法
      // SharedPreferences.setMockInitialValues({});
      // 获取保存实例
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 如果counter为空，需要避空运算符 ?? 0
      int counter = (prefs.getInt("counter") ?? 0) + 1;
      // counter++;
      print("pressed $counter times.");
      await prefs.setInt("counter", counter);

      // print(counter);
    } catch (e) {
      print(e);
    }
  }

  void _decrementCount() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int counters = prefs.getInt("counter") ?? 0;
      if (counters > 0) {
        counters--;
      }
      await prefs.setInt("counter", counters);
      print("pressed $counters times");
    } catch (e) {
      print(e);
    }
  }

  void _removeCount() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 删除内容
      await prefs.remove("counter");
      int counters = prefs.getInt("counter") ?? 0;
      print("pressed $counters times");
    } catch (e) {
      print(e);
    }
  }

  void _addMyContent() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 删除内容
      await prefs.setString("hi", "hello world");
      String content = prefs.getString("hi") ?? "";
      print("设置字符串的内容是： $content ");
    } catch (e) {
      print(e);
    }
  }

  void _getMyContent() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String content = prefs.getString("hi") ?? "";
      print("获取字符串的内容是： $content ");
    } catch (e) {
      print(e);
    }
  }

  void _clearContent() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      print(e);
    }
  }
}
