// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/consumer/03_selector/user_model6.dart';
import 'package:ufo/12_log/02_log.dart';

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
    var log = MyselfPrinter.logger(SelectExample);

    final paths = "D:/flutterObject/ufo/lib/12_log";
    var files;

    Directory getDirectory(String path) {
      return Directory(path);
    }

    Future<List<FileSystemEntity>> getFiles(path) async {
      // final files = path.listSync(); //返回目录下的所有文件
      // 只返回文件
      path = getDirectory(paths);
      final files = path.listSync(recursive: false);
      log.i("logs 下的文件是：$files");
      log.i("路径是：$path");
      return files;
    }

    print(files);

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
              ElevatedButton(
                  onPressed: () {
                    getFiles("D:/flutterObject/ufo/logs");
                  },
                  child: Text("调用函数"))
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
