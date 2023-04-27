import 'dart:io';

import 'package:date_format/date_format.dart';

class DeleteLogfiles {
  final path = "logs";

  // 2.获取3天之前的日志文件列表
  List getFilesList() {
    final logFileLists = [];
    // 2.1 获取3天内的时间
    final now = DateTime.now();
    final towDaysAgo = now.subtract(const Duration(days: 3));
    final threeDaysAgo = now.subtract(const Duration(days: 3));

    final List<DateTime> dayTimes = [now, towDaysAgo, threeDaysAgo];

    for (int i = 0; i <= dayTimes.length; i++) {
      // 2.2获取日期格式的文件
      final fileName = "$path/$i.text";
      logFileLists.add(fileName);
    }
    return logFileLists;
  }

  // 3.获取logs路径下的所有文件
  Future<List<FileSystemEntity>> getFiles(path) async {
    // final files = path.listSync(); //返回目录下的所有文件
    // 只返回文件
    final files = path.listSync(recursive: false);
    return files;
  }

  // 4.判断logs 下的文件，删除掉除了3天内日志文件的其他所有文件
  DeleteLogfiles(path) {
    final logFileLists = getFilesList();
    final files = getFiles(path);
    for(int i = 0;i <= files.l)
  }
}
