// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/consumer/01_provider_of/count_notifier1.dart';

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
        title: const Text("Consumer Demo"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ConsumerDemo(),
      // 浮动按钮 结合scaffold使用
      floatingActionButton: FloatingActionButton(
        onPressed:
            Provider.of<CountNotifier1>(context, listen: true).changeCount,
        tooltip: "Increment",
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ConsumerDemo extends StatelessWidget {
  const ConsumerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // consumer7 可以同事引用7个组建模型
          Consumer<CountNotifier1>(
            // 1.调用 模型 消费者使用模型数据
            builder: (context, countNotifier1, child) {
              return Column(
                children: [
                  Text(
                    countNotifier1.count.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: countNotifier1.changeCount,
                      child: const Text("增加按钮"),
                    ),
                  ),
                  // 2.不使用模型数据 避免每次模型更新重构 浪费性能
                  child!,
                ],
              );
            },
            // 2.不使用模型数据 避免每次模型更新重构 浪费性能
            child: Column(
              children: const [
                Text("更多组件信息....."),
                Text("更多组件信息....."),
                Text("更多组件信息....."),
                Text("更多组件信息....."),
                Text("更多组件信息....."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
