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
        title: const Text("复选框"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const CheckBoxDemo(),
    );
  }
}

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  late bool _male = true;
  late bool _female = false;
  late bool _transgender = true;

  late bool _value1 = true;
  late bool _value2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
              value: _female,
              onChanged: (value) {
                setState(() {
                  _female = value!;
                });
              }),
          title: const Text("女"),
        ),
        ListTile(
          // 单选框 Checkbox
          leading: Checkbox(
            // 单选布尔值
            value: _transgender,
            // 选择触发的回到函数
            onChanged: (value) {
              setState(() {
                _transgender = value!;
              });
            },
            // 选中后-方框的颜色
            activeColor: Colors.pink,
            // 选中后-对钩的颜色
            checkColor: Colors.black,
          ),
          title: const Text("人妖皇后"),
        ),
        ListTile(
          leading: Checkbox(
              value: _male,
              onChanged: (value) {
                setState(() {
                  _male = value!;
                });
              }),
          title: const Text("男"),
        ),
        CheckboxListTile(
          value: _value1,
          onChanged: (value) {
            setState(() {
              _value1 = value!;
            });
          },
          // logo
          secondary: const Icon(
            Icons.alarm,
            size: 50,
          ),
          // 主标题
          title: const Text("5:00 叫我起床"),
          // 次标题
          subtitle: const Text("太早了，起不来啊太早了，起不来啊太早了，起不来啊太早了，起不来啊"),
          // 选中状态 - 影响组件的属性
          selected: _value1,
          // 选中后 - 对钩的颜色
          checkColor: Colors.black,
          // 选中后 - 其他的颜色
          activeColor: Colors.green,

          // 未选中时背景颜色
          tileColor: Colors.grey[100],
          // 选中时背景颜色
          selectedTileColor: Colors.blue[100],
          // 选中后动画效果 - title 稠密
          // dense: _value1,
          // 不可选中 enabled
          // enabled: _value1,
          // true时，变成3行显示
          // isThreeLine: !_value1,
          contentPadding: const EdgeInsets.all(5),
          // 勾选框的样式
          side: const BorderSide(
            width: 2,
            color: Colors.red,
            // 没什么效果
            // strokeAlign: BorderSide.strokeAlignCenter
          ),
          // 界面组件的视觉密度
          // visualDensity: VisualDensity.compact,
        ),
        CheckboxListTile(
          value: _value2,
          onChanged: (value) {
            setState(() {
              _value2 = value!;
            });
          },
          // logo
          // secondary: Image.asset("images/2.0x/1.jpg"),
          secondary: const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/2.0x/1.jpg"),
          ),
          title: const Text("5:00 叫我起床"),
          tileColor: Colors.blue[100],
          subtitle: const Text("太早了，起不来啊"),
          selected: _value2,
          checkColor: Colors.black,
          activeColor: Colors.green[200],
        )
      ],
    );
  }
}
