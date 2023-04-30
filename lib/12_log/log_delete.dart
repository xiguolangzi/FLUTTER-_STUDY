import 'dart:io';
import 'package:date_format/date_format.dart';

class DeleteLogFiles {
  final String path;
  final int days;
  DeleteLogFiles({this.path = "logs", this.days = 3});

  Future<void> deleteNotLogFiles() async {
    // 获取日志路径
    final Directory directory = Directory(path);
    // 判断日志路径是否存在
    if (directory.existsSync()) {
      // directory.listSync() 获取日志路径下的所有文件 -> 遍历 forEach
      directory.listSync().forEach((element) {
        // 获取文件名称
        String file = element.path.split(Platform.pathSeparator).last;
        // 判断 element 是文件，并且不在 logNameList 内
        if (element is File &&
            !GetLogNameList(days: days).logNameList.contains(file)) {
          print("日志文件清理 == 清理 == $element");
          // 删除日志文件
          element.deleteSync();
        }
      });
    }
  }
}

class GetLogNameList {
  int days;
  final _logNameList = [];

  GetLogNameList({this.days = 3});

  // 时间转化 -> 获取日志文件名称列表
  final now = DateTime.now();
  final nowTime = formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]);

  List get logNameList => getDayTimes();

  List getDayTimes() {
    _logNameList.add("$nowTime.log");
    for (days; days >= 1; days--) {
      var daytime = formatDate(
        now.subtract(Duration(days: days)),
        [yyyy, "-", mm, "-", dd],
      );
      _logNameList.add("$daytime.log");
    }
    print("保留日志名称列表是：$_logNameList");
    return _logNameList;
  }
}
