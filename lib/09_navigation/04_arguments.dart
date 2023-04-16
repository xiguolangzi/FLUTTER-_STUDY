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
        title: const Text("路由传参"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                // 6.1 匿名路由传参 arguments
                onPressed: () => Navigator.pushNamed(context, "product",
                    arguments: {"title": "我是主页传来的参数"}),
                child: const Text("跳转到 商品页面")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/user/2/3/4"),
                child: const Text("跳转到 未知页面")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "productDetail",
                    arguments: {"id": 1}),
                child: const Text("跳转到 商品页面-1")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "productDetail",
                    arguments: {"id": 2}),
                child: const Text("跳转到 商品页面-2")),
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    // 6.2 获取参数
    final Map aguments = ModalRoute.of(context)!.settings.arguments as Map;

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
        child: Column(
          children: [
            // ignore: prefer_interpolation_to_compose_strings
            Text("当前参数是：" + aguments["title"]),

            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("返回"))
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map aguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      // 1.应用头部
      appBar: AppBar(
        // 1.1 左侧菜单
        leading: const Icon(Icons.menu),
        // 1.2 头部标题
        title: const Text("商品详情"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: Center(
        child: Column(
          children: [
            Text("当前商品的 ID 是：${aguments["id"]}"),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("返回"))
          ],
        ),
      ),
    );
  }
}

class UnkoownPage extends StatelessWidget {
  const UnkoownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1.应用头部
      appBar: AppBar(
        // 1.1 左侧菜单
        leading: const Icon(Icons.menu),
        // 1.2 头部标题
        title: const Text("404"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("返回"))
          ],
        ),
      ),
    );
  }
}
