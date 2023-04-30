// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:io';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("首页"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      // 2.应用主体
      body: const FilesDemo(),
    );
  }
}

class FilesDemo extends StatelessWidget {
  const FilesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final localPath = getLocalFiles();
    return SingleChildScrollView(
      child: Column(
        children: [Text("当前路径是：$localPath")],
      ),
    );
  }
}

// 1.获取指定路径
Directory getDirectory(String path) {
  return Directory(path);
}

const String path = "logs";

// 获取当前路径下的文件 默认本地是根目录
getLocalFiles() {
  // 获取当前路径
  // final directory = Directory.current;
  // 1.获取指定路径
  final directory = getDirectory(path);
  // 2.获取当前路径下的所有文件 List<FileSystemEntity>(文件+路径)
  final List<FileSystemEntity> files = directory.listSync();
  print("----- $files");

  // 3. 根据不同系统转化反斜杠 - 获取相对文件路径
  if (Platform.isWindows) {
    for (var file in files) {
      if (file is File) {
        var newpath = file.path.replaceAll(r"\", "/");
        print("路径下的文件：${newpath}");
      } else if (file is Directory) {
        var newpath = file.path.replaceAll(r"\", "/");
        print("路径是：${newpath}");
      }
    }
  }

  // 4.只获取文件名称
  for (FileSystemEntity file in files) {
    String fileName = file.path.split(Platform.pathSeparator).last;
    print(fileName);
    return fileName;
  }

  // 5.检查路径是否存在，不存在则创建路径
  String path1 = "logs";
  Directory directory2 = Directory(path1);
  if (directory2.existsSync()) {
    print("日志路径已经存在");
  } else {
    // recursive 是否创建父级路径
    directory2.createSync(recursive: true);
  }

  print("---------------------");

  // // 6.读 - 写 - 删除 文件
  // File file6 = File(directory.path);
  // print("***** $file6");
  // file6.writeAsStringSync("我要写入文件");
  // file6.readAsStringSync();
  // file6.deleteSync();
}
