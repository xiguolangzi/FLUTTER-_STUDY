import 'dart:async';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ufo/12_log/02_log.dart';

class LogOutText {
  // var log = MyselfPrinter.logger(LogOutText);

  final String path;
  String logInformation;
  LogOutText(this.logInformation, {this.path = "logs"}) {
    appendTextToFile();
  }

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

  // 创建日志文件
  Future<File> creatLogFiles() async {
    // 检查日志路径
    Directory directory = Directory(path);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    // 创建日志文件
    final filePath = "$path/$dayTimes.log";
    return File(filePath);
  }

  // 文件追加写入，如果没有文件 新建后追加信息
  Future<void> appendTextToFile() async {
    // final filePath = "$path/$dayTimes.text";
    File file = await creatLogFiles();
    // 删除掉文本中的终端控制码
    RegExp exp = RegExp(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]');
    logInformation = logInformation.replaceAll(exp, '');

    file.writeAsStringSync('$logInformation;\n', mode: FileMode.append);
  }
}
