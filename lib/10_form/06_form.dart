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
        title: const Text("表单 form"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const FormDemo(),
    );
  }
}

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  // 1.定义 表单唯一标识
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                // 2.绑定 表单唯一键
                key: _formKey,
                child: Column(
                  children: [
                    // 3.表单文本框
                    TextFormField(
                      // 3.1 文本框修饰
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mobile_friendly),
                        iconColor: Colors.blue,
                        hintText: "手机号",
                      ),
                      // 3.2 自动聚焦
                      autofocus: true,
                      //  3.3 文本框 - 校验
                      validator: (value) {
                        // 正则表达式
                        RegExp reg = RegExp(r"^\d{11}$");
                        if (!reg.hasMatch(value!)) {
                          return "手机号非法";
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  // 表单校验 _formKey.currentState!.validate() true 货 false
                                  if (_formKey.currentState!.validate()) {
                                    print("提交成功");
                                  }
                                },
                                child: const Text("提交")))
                      ],
                    )
                  ],
                )),
          ],
        ));
  }
}
