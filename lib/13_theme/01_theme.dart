// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("主题"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Theme Exaple",
            // 引用文本主题
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "新按钮abc",
                style: Theme.of(context).textTheme.bodySmall,
              )),
        ],
      ),
    );
  }
}
