import 'package:flutter/material.dart';
import './Hello.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 1.任务管理器中应用的名称
      title: "Flutter Demo 01",
      // 2.主体内容
      home: Home(),
      // 3.右上角调试标识
      debugShowCheckedModeBanner: false,
    );
  }
}
