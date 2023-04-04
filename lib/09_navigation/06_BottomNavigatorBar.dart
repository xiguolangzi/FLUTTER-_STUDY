// ignore: file_names
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 对应 BottomNavigationBar 的 items --菜单数组
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        backgroundColor: Colors.blue[100],
        label: "首页"),
    BottomNavigationBarItem(
        icon: const Icon(Icons.message),
        backgroundColor: Colors.green[100],
        label: "消息"),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.yellow[100],
        label: "购物车"),
    BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        backgroundColor: Colors.red[100],
        label: "我")
  ];

  // 对应body窗体 -- 页面数组
  final List<Widget> pages = [
    const Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        "Message",
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        "Cart",
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 50),
      ),
    )
  ];

  // 定义BottomNavigationBar 的 currentIndex
  late int currentIndex;

  // 初始化 currentIndex
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  // 点击时，触发更新当前 currenIndex
  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1.应用头部
      appBar: AppBar(
        // 1.1 左侧菜单
        leading: const Icon(Icons.menu),
        // 1.2 头部标题
        title: const Text("BottomNavigatorBar"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2. 底部导航栏 BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        // 2.5.1 导航栏 菜单
        items: bottomNavItems,
        // 2.5.2 导航栏 索引
        currentIndex: currentIndex,
        // 2.5.3 导航栏 样式
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting,
        // 2.5.4 导航栏 点击操作
        onTap: (value) {
          _changePage(value);
        },
      ),
      // 3.应用主体
      body: pages[currentIndex],
    );
  }
}
