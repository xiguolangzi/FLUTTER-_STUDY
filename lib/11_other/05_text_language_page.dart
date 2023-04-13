// ignore: file_names
import 'package:flutter/material.dart';
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
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        // "主页",
        // Localizations.of(context, CustomLocalizations).t("首页"),
        CustomLocalizationsActive.setLanguage(context, "首页"),
        style: const TextStyle(fontSize: 60),
      ),
    );
  }
}
