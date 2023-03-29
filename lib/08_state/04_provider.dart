import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. 创建 provider ,注册数据模型
    return ChangeNotifierProvider(
      // 2.1注册数据模型，指向数据模型
      create: (BuildContext context) => LikesModel(),
      // 2.2 绑定子组件
      child: Scaffold(
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
        body: const MyHonePage(),
        // 浮动按钮 结合scaffold使用
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Increment",
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// 1.创建数据模型
class LikesModel extends ChangeNotifier {
  int _counter = 0;
  // 访问私有变量
  int get counter => _counter;
  // 累加函数
  incrementCounter() {
    _counter++;

    // 1.2通知UI 更新 监听者（子组件更新）
    notifyListeners();
  }
}

class MyHonePage extends StatelessWidget {
  const MyHonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 3.1通过context获取， resd()只读，watch()有监控效果，select()选择项监控
        // watch 指定数据类型 LikesModel
        Text(context.watch<LikesModel>().counter.toString()),
        TextButton(
            // 3.2使用provider静态方法，要指定数据类型LikesModel
            onPressed: Provider.of<LikesModel>(context).incrementCounter,
            child: const Icon(Icons.thumb_up))
      ],
    );
  }
}
