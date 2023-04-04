// ignore: file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // 1.菜单数组
  final List<Widget> _tabs = [
    const Tab(
      text: "首页",
      icon: Icon(Icons.home),
    ),
    const Tab(
      text: "添加",
      icon: Icon(Icons.add),
    ),
    const Tab(
      text: "搜索",
      icon: Icon(Icons.search),
    )
  ];

  // 2.页面数组
  final List<Widget> _tabView = [
    const Icon(
      Icons.home,
      size: 120,
      color: Colors.red,
    ),
    const Icon(
      Icons.add,
      size: 120,
      color: Colors.green,
    ),
    const Icon(
      Icons.search,
      size: 120,
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // 菜单数量
        length: _tabs.length,
        child: Scaffold(
          // 1.应用头部
          appBar: AppBar(
            // 1.1 左侧菜单
            leading: const Icon(Icons.menu),
            // 1.2 头部标题
            title: const Text("Tab"),
            // 1.3 右侧菜单
            actions: const [Icon(Icons.settings), Icon(Icons.search)],
            // 1.4 标题居中
            centerTitle: true,
            // 1.5 导航底部
            bottom: TabBar(
              tabs: _tabs,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorPadding: const EdgeInsets.all(5),
            ),
          ),
          // 3.应用主体 - 底部菜单栏 - 绑定菜单页面
          body: TabBarView(children: _tabView),
          // 3.1 底部菜单组件 TabBar
          bottomNavigationBar: TabBar(
            // 3.1.1 绑定菜单列表
            tabs: _tabs,
            // 3.1.2标签颜色
            labelColor: Colors.blue,
            // 3.1.3未选中的标签颜色
            unselectedLabelColor: Colors.black54,
            // 3.1.4 底部条 - 颜色
            indicatorColor: Colors.blue,
            // 3.1.4 底部条 - 宽度
            indicatorSize: TabBarIndicatorSize.tab,
            // 3.1.4 底部条 - 厚度
            indicatorWeight: 5,
            // 3.1.4 底部条 - padding
            indicatorPadding: const EdgeInsets.all(5),
          ),
        ));
  }
}
