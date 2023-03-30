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
        title: const Text("首页"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            // 此处不能return
            // 1. 路由跳转 Navigator.push
            Navigator.push(
                context,
                // 2. 指定路由
                MaterialPageRoute(builder: (context) => const Product()));
          },
          child: const Text("跳转到商品页面")),
    );
  }
}

// 3.跳转的页面
class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 1.应用头部
        appBar: AppBar(
          // 1.1 左侧菜单
          leading: const Icon(Icons.menu),
          // 1.2 头部标题
          title: const Text("商品页面"),
          // 1.3 右侧菜单
          actions: const [Icon(Icons.settings), Icon(Icons.search)],
          // 1.4 标题居中
          centerTitle: true,
        ),
        // 2.应用主体
        body: Center(
          child: ElevatedButton(
              //跳转后返回  Navigator.pop
              onPressed: () => Navigator.pop(context),
              child: const Text("返回")),
        ));
  }
}
