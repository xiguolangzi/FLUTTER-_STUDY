// ignore: file_names
// ignore_for_file: prefer_const_constructors

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
        title: const Text("Colunm_Row"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const ColumnRowDemo(),
    );
  }
}

class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.green[100],
      width: double.infinity,
      child: Column(
        // 主轴对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 交叉轴对齐方式
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(
            Icons.access_alarm,
            size: 50,
          ),
          Icon(
            Icons.person,
            size: 50,
          ),
          const Icon(
            Icons.settings,
            size: 50,
          ),
          const Icon(
            Icons.payment,
            size: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.access_alarm,
                size: 50,
              ),
              Icon(
                Icons.person,
                size: 50,
              ),
              Icon(
                Icons.settings,
                size: 50,
              ),
              Icon(
                Icons.payment,
                size: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
