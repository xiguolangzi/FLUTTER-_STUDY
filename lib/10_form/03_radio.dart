// ignore: file_names
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
        title: const Text("单选框"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const RadioDemo(),
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _gender = 1;
  int _clarm = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("男"),
              Radio(
                  value: 1,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  }),
              const Text("女"),
              Radio(
                  value: 2,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _gender == 1 ? "男" : "女",
                style:
                    TextStyle(fontSize: 20, backgroundColor: Colors.green[100]),
              ),
            ],
          ),
          RadioListTile(
            value: 1,
            groupValue: _clarm,
            onChanged: (value) {
              setState(() {
                _clarm = value!;
              });
            },
            secondary: const Icon(
              Icons.alarm,
              size: 50,
            ),
            title: const Text("8:00 叫我起床"),
            subtitle: const Text("起床洗漱刷牙"),
            selected: _clarm == 1,
            selectedTileColor: Colors.green[50],
          ),
          RadioListTile(
            value: 2,
            groupValue: _clarm,
            onChanged: (value) {
              setState(() {
                _clarm = value!;
              });
            },
            secondary: const Icon(
              Icons.alarm,
              size: 50,
            ),
            title: const Text("9:00 叫我就餐"),
            subtitle: const Text("直接吃饭-鸡蛋+鸡蛋"),
            selected: _clarm == 2,
            selectedTileColor: Colors.green[50],
          )
        ],
      ),
    );
  }
}
