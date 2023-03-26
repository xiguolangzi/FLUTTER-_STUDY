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
        title: const Text("ListViewSeperatedDemo"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: ListViewSeperatedDemo(),
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

class ListViewSeperatedDemo extends StatelessWidget {
  ListViewSeperatedDemo({super.key});
  final List<Widget> products = List.generate(
      20,
      (index) => ListTile(
            leading: const Icon(Icons.settings),
            title: Text("商品名称 $index"),
            subtitle: Text("子标题 $index"),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ));

  @override
  Widget build(BuildContext context) {
    Widget dividerOdd = const Divider(
      color: Colors.blue,
      thickness: 1,
    );
    Widget dividerEven = const Divider(
      color: Colors.red,
      thickness: 1,
    );
    return Column(
      children: [
        const ListTile(
          title: Text("商品列表"),
        ),
        Container(
          height: 300,
          child: ListView.separated(
              // 收缩包装，给一定的空间，否则会因为没有限制尺寸而报错
              // shrinkWrap: true,
              itemBuilder: (BuildContext, index) {
                return products[index];
              },
              // 分隔器的构造器
              separatorBuilder: (BuildContext, index) {
                return index % 2 == 0 ? dividerEven : dividerOdd;
              },
              itemCount: products.length),
        )
      ],
    );
  }
}
