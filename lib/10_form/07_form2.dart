// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ufo/12_log/02_log.dart';

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
  late String _phone;
  late String _password;
  var log = MyselfPrinter.logger(_FormDemoState);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mobile_friendly),
                        iconColor: Colors.blue,
                        hintText: "手机号",
                      ),
                      autofocus: true,
                      validator: (value) {
                        // 正则表达式
                        RegExp reg = RegExp(r"^\d{11}$");
                        if (!reg.hasMatch(value!)) {
                          return "手机号非法";
                        }
                        return null;
                      },
                      // 提交表单时 赋值保存
                      onSaved: (value) {
                        log.i(" _phone = value onsave");
                        _phone = value!;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.visibility),
                        iconColor: Colors.blue,
                        hintText: "密码",
                      ),
                      autofocus: true,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "密码非法";
                        }
                      },
                      // 提交表单时 赋值保存
                      onSaved: (value) {
                        log.i(" _password = value onsave");
                        _password = value!;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  // 表单校验 _formKey.currentState!.validate() true 或 false
                                  if (_formKey.currentState!.validate()) {
                                    log.i("提交成功");
                                    log.i(
                                        "_formKey.currentState!.save() befor");
                                    // 执行 表单提交
                                    _formKey.currentState!.save();
                                    log.i(
                                        "_formKey.currentState!.save() after");
                                    log.i(_phone);
                                    log.i(_password);
                                  }
                                },
                                child: const Text("提交"))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  // 执行 重置
                                  _formKey.currentState!.reset();
                                },
                                child: const Text("重置"))),
                      ],
                    )
                  ],
                )),
          ],
        ));
  }
}
