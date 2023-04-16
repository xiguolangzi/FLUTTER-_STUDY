// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:ufo/12_log/02_log.dart';

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
        title: const Text("网络请求"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: DioDemo(),
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

class DioDemo extends StatelessWidget {
  DioDemo({super.key});
  var log = MyselfPrinter.logger(DioDemo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            getIpAddress();
          },
          child: const Text("点击发送请求")),
    );
  }

  void getIpAddress() async {
    try {
      const url = "https://httpbin.org/ip";
      Response response = await Dio().get(url);
      String ip = response.data["origin"];
      log.i(ip);
    } catch (e) {
      log.e(e);
    }
  }
}
