// ignore: file_names
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ufo/12_log/02_log.dart';
import 'CustomLocalizationsActive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        // title: const Text("文本-多语言"),
        // 1.引用多语言
        // title: Text(Localizations.of(context, CustomLocalizations).t("文本-多语言")),
        // 2.优化后 引用多语言
        title: Text(CustomLocalizationsActive.setLanguage(context, "文本-多语言")),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var log = MyselfPrinter.logger(HomePage);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        // "主页",
        // Localizations.of(context, CustomLocalizations).t("首页"),
        CustomLocalizationsActive.setLanguage(context, "首页"),
        style: const TextStyle(fontSize: 60),
      ),
      ElevatedButton(
          onPressed: () {
            log.e(" 测试 error 日志打印");
            log.i(" 测试 info 日志打印");
            log.w(" 测试 warning 日志打印");
          },
          child: const Text("测试打印日志"))
    ]);
  }
}
