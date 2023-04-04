// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        title: const Text("开关"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const SwitchDemo(),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  late bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Switch(
              // 开关状态
              value: _switchValue,
              // 点击开关触发回调函数
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
              // 开启时-圆点颜色
              activeColor: Colors.green,
              // 开启时-轨道颜色
              activeTrackColor: Colors.green[100],
              // 关闭时-圆点颜色
              inactiveThumbColor: Colors.red,
              // 关闭时-轨道颜色
              inactiveTrackColor: Colors.red[100],
              // 开启时-圆点图片
              activeThumbImage: const AssetImage("images/2.0x/1.jpg"),
              // 关闭时-圆点图片
              inactiveThumbImage: const AssetImage("images/2.0x/0.jpg"),
            ),
            title: Text("当前的状态是：${_switchValue == true ? "开启" : "关闭"}"),
          ),
          ListTile(
            leading: CupertinoSwitch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
              // 启用时-轨道颜色
              activeColor: Colors.green[100],
              // 关闭时-轨道颜色
              trackColor: Colors.red[100],
              // 开关圆点颜色
              thumbColor: const Color.fromARGB(166, 7, 250, 238),
            ),
            title: Text("当前IOS风格的状态是：${_switchValue == true ? "开启" : "关闭"}"),
          )
        ],
      ),
    );
  }
}
