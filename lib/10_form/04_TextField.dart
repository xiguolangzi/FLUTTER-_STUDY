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
        title: const Text("表单"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const TextFielDemo(),
    );
  }
}

class TextFielDemo extends StatefulWidget {
  const TextFielDemo({super.key});

  @override
  State<TextFielDemo> createState() => _TextFielDemoState();
}

class _TextFielDemoState extends State<TextFielDemo> {
  // 1.定义表单参数
  late String userPhone;
  late String password;
  late String description;

  // 5.2 表单提交调用的回调函数
  _regist() {
    print(userPhone);
    print(password);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // 2. 表单 - 输入类型
            TextField(
              // 2.1 自动聚焦，一个表单只能有一个
              autofocus: true,
              // 2.2 移动端输入键盘类型，不适用PC端
              keyboardType: TextInputType.number,
              // 2.3 表单-装饰
              decoration: const InputDecoration(
                // 2.3.1 - logo
                prefixIcon: Icon(Icons.phone),
                // 2.3.2 - 标签
                labelText: "手机号",
                labelStyle: TextStyle(color: Colors.blue, fontSize: 15),
                // 2.3.3 - 提示信息
                hintText: "请输入手机号",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                // 2.3.4 聚焦时 - 边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1)),
                // 2.3.5 非聚焦时 - 边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
              ),
              // 3 控制输入的最大长度
              maxLength: 11,
              // 4.改变输入时调用的回调函数
              onChanged: (value) {
                setState(() {
                  userPhone = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.code),
                labelText: "密码",
                hintText: "请输入密码",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "文本域",
                hintText: "请自我介绍",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
              ),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),

            SizedBox(
              width: double.infinity,
              // 5. 声明提交按钮
              child: ElevatedButton(
                  // 5.1 点击按钮 - 调用回调函数
                  onPressed: () {
                    _regist();
                  },
                  child: const Text("提交")),
            )
          ],
        ));
  }
}
