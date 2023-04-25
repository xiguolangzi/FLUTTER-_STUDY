// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/consumer/01_provider_of/count_notifier1.dart';
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
        title: const Text("ProviderOfDemo"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ProviderOfDemo(),
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

class ProviderOfDemo extends StatelessWidget {
  const ProviderOfDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            Provider.of<CountNotifier1>(context).count.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: Provider.of<CountNotifier1>(context, listen: true)
                  .changeCount,
              child: const Text("增加按钮"),
            ),
          )
        ],
      ),
    );
  }
}
