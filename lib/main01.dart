// 1.快捷键importM
import 'package:flutter/material.dart';

// 2.main入口函数
void main() {
  runApp(const Center(
    // 3.text组件
    child: Text(
      "你好 Flutter",
      // 4.text必须给定方向属性赋值
      textDirection: TextDirection.ltr,
      // 5.style属性
      style: TextStyle(
          // textStyle属性
          color: Colors.red,
          fontSize: 50),
    ),
  ));
}
