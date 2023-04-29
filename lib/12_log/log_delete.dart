import 'dart:io';

import 'package:date_format/date_format.dart';

class DeleteLogfiles {
  final path = "logs";
  final int days = 3;
  
  // 时间转化 -> 获取日志文件名称列表
  final now = DateTime.now();
  final nowTime = formatDate(DateTime.now(),[yyyy,"-",mm,"-",dd]);
  List daysTimes = [];
  List getDayTimes(int days){
    daysTimes.add("$path/$nowTime.log");
    for (days;days>=1;days--){
      var daytime = formatDate(
        now.subtract(Duration(days: days)),
        [yyyy,"-",mm,"-",dd],
      );
      daysTimes.add("$path/$daytime.log");
    }
    return daysTimes;
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
    final files = getFiles(path);
    for(int i = 0;i <= files.lenth){

    }
  }
}
