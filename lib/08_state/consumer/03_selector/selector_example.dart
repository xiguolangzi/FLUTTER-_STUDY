// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/consumer/03_selector/user_model6.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Consumer Demo"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const SelectExample(),
    );
  }
}

class SelectExample extends StatelessWidget {
  const SelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Selector 中 int 为 userModel6.age 数据类型,支取模型中的AGE值userModel6.age
      child: Selector<UserModel6, int>(
        selector: (context, userModel6) => userModel6.age,
        //ageInit == userModel6.age
        builder: (context, ageInit, child) {
          return Column(
            children: [
              Text(
                ageInit.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: Provider.of<UserModel6>(context).chaneAge,
                child: const Text("改变年龄按钮"),
              ),
              const SizedBox(
                height: 20,
              ),
              // 避免重构不需要的组件
              child!,
            ],
          );
        },
        // 避免重构不需要的组件
        child: Column(
          children: const [
            Text("更多组件信息...."),
            Text("更多组件信息...."),
            Text("更多组件信息...."),
            Text("更多组件信息...."),
          ],
        ),
      ),
    );
  }
}
