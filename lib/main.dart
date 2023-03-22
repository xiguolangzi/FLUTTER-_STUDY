import 'package:flutter/material.dart';
// import './Hello.dart';
// import '02_layout/01_Container.dart';
// import '02_layout/02_column_row.dart';
// import '02_layout/03_Flex.dart';
// import '02_layout/04_Wrap.dart';
// import '02_layout/05_Stack.dart';
import '02_layout/06_Card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1.任务管理器中应用的名称
      title: "Flutter Demo 01",
      // 2.主体内容
      home: const Home(),
      // 3.右上角调试标识
      theme: ThemeData(fontFamily: "Fasthand"),
      debugShowCheckedModeBanner: false,
    );
  }
}
