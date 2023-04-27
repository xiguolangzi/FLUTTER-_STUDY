import 'dart:async';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ufo/12_log/02_log.dart';

class LogOutText {
  var log = MyselfPrinter.logger(LogOutText);

  final path = "logs";
  final dayTimes = formatDate(
    DateTime.now(),
    [
      yyyy,
      "-",
      mm,
      "-",
      dd,
    ],
  );
  //判断文件是否存在
  // bool isFileExist(String filePath) {
  //   File file = File(filePath);
  //   return file.existsSync();
  // }

  // 获取文件
  Future<File> creatLogFiles() async {
    final filePath = "$path/$dayTimes.log";
    return File(filePath);
  }

  // 追加写入
  // void appendTextToFile(String text, String filePath) {
  //   File file = File(filePath);
  //   file.writeAsStringSync('$text\n', mode: FileMode.append);
  // }

  // 文件追加写入，如果没有文件 新建后追加信息
  Future<void> appendTextToFile(String logs) async {
    // final filePath = "$path/$dayTimes.text";
    File file = await creatLogFiles();
    // 删除掉文本中的终端控制码
    RegExp exp = RegExp(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]');
    logs = logs.replaceAll(exp, '');

    file.writeAsStringSync('$logs;\n', mode: FileMode.append);
  }
}
