import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';

class LogPrintDemo {
  final logger = Logger(
      // 1. 设置打印器
      printer: PrettyPrinter(
        stackTraceBeginIndex: 0,
        // 信息最大行数
        methodCount: 2,
        // 报错信息最大行数
        errorMethodCount: 3,
        // 日志分隔线的长度
        lineLength: 50,
        // 是否显示不同颜色
        colors: true,
        // 是否有不同标识
        printEmojis: true,
        // 是否打印时间
        printTime: true,
      ),
      // 2. 过滤器：什么环境下打印日志 -- ProductionFilter 生产环境、DevelopmentFilter 开发环境
      filter: ProductionFilter(),
      // 3. 输出日志到指定目的
      output: LogOutputFile(),
      // 4. 控制日志显示级别 Verbose < DeBug < Info < Warning < Error <wtf what a terriable failure
      level: Level.warning);
}

class LogOutputFile extends LogOutput {
  @override
  void init() {
    super.init();
  }

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }

  @override
  void destroy() {
    // TODO: implement destroy
    super.destroy();
  }
}

class LogFilesWrite {
  // 读写文件 - 获取文件路径
  Future<String> get _localPath async {
    // 获取 文档文件路径
    final directory = await getApplicationDocumentsDirectory();
    // 获取 临时文件路径
    // final directory = await getTemporaryDirectory();
    // 获取 下载文件路径
    // final directory = await getDownloadsDirectory();

    Logger().i("文档文件路径是：${directory.path}");
    return directory.path;
  }

  // 读写文件 - 创建文件
  Future<File> get _localFile async {
    // 获取 文档文件路径
    final path = await _localPath;

    return File("$path/logs.txt");
  }

  Future<File> writeLogs(String log) async {
    final file = _localFile;

    return file;
  }
}
