import 'package:logger/logger.dart';
import 'package:date_format/date_format.dart';

import 'log_delete.dart';
import 'log_out_text.dart';

class MyselfPrinter extends LogPrinter {
  // 1.类名称参数
  late String className;

  // 2.实例化
  MyselfPrinter(this.className);

  // 外界调用的静态方法
  static Logger logger(Type type) => Logger(
        // 选择log打印方法
        printer: MyselfPrinter(type.toString()),
        // 打印级别控制
        // level: Level.warning,
        // 过滤器：什么环境下打印日志 -- ProductionFilter 生产环境、DevelopmentFilter 开发环境
        filter: ProductionFilter(),
        // 输出日志到指定目的
        output: LogOutputFile(),
        level: Level.info,
      );

  // 3.1 自定义 emoji
  static final levelEmojis = {
    Level.verbose: 'verbose',
    Level.debug: 'debug',
    Level.info: 'info',
    Level.warning: 'warning',
    Level.error: 'error',
    Level.wtf: 'wtf',
  };

  // 3.2 自定义 colors
  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.fg(50),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(220), //208
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(200),
  };

  // 3.实现抽象方法 -- 参考 PrettyPrinter
  @override
  List<String> log(LogEvent event) {
    final colors = levelColors[event.level];
    // final emoji = PrettyPrinter.levelEmojis[event.level];
    final emoji = levelEmojis[event.level];
    final message = event.message;
    // 3.2时间转化
    final dayTime = DateTime.now();
    final dayTimes = formatDate(
        dayTime, [yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", ss]);

    return [
      colors!("$dayTimes  [ className: $className ] [ $emoji ] : $message "),
    ];
  }
}

// 4.日志文件输出
class LogOutputFile extends LogOutput {
  @override
  void init() {
    super.init();
  }

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      // 控制台打印
      print(line);
      // 文件写入 --- 待开发
      LogOutText(line, path: "logs");
    }
  }

  @override
  void destroy() {
    // super.destroy();
    // 文件清理 -- 待开发
    print("内部清理日志文件");
    DeleteLogFiles(days: 2, path: "logs").deleteNotLogFiles();
  }
}
