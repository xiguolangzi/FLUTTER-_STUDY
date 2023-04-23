// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/01_changeNotifierProveder/user_model1.dart';
import 'package:ufo/08_state/proveder/02_futureProvider/user_model2.dart';
import 'package:ufo/08_state/proveder/03_streamProvider/user_model3.dart';
import 'package:ufo/08_state/proveder/04_multiProvider/user_model4.dart';

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
        title: const Text("Multi ProviderDemo"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const MultiProviderDemo(),
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

class MultiProviderDemo extends StatelessWidget {
  const MultiProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // 4.消费者
          Consumer<UserModel1>(
            // 参数名称不可以与所述类型一样
            builder: (BuildContext context, userModel1, child) {
              return Text(
                userModel1.name,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              );
            },
          ),
          // 消费者
          Consumer<UserModel1>(
            // 参数名称不可以与所述类型一样
            builder: (BuildContext context, userModel, child) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    userModel.changeName();
                  },
                  child: const Text("改变值"),
                ),
              );
            },
          ),
          Consumer<UserModel4>(
            // 参数名称不可以与所述类型一样
            builder: (BuildContext context, userModel1, child) {
              return Text(
                userModel1.age.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              );
            },
          ),
          // 消费者
          Consumer<UserModel4>(
            // 参数名称不可以与所述类型一样
            builder: (BuildContext context, userModel, child) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    userModel.changeName();
                  },
                  child: const Text("改变值 -  年龄"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
