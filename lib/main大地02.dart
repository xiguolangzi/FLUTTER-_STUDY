import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("hello world!"),
        ),
        body: Column(
          children: const [
            MyApp(),
            // SizedBox 增加一个盒子的高度
            SizedBox(
              height: 20,
            ),
            Circular(),
            SizedBox(
              height: 20,
            ),
            ClipImage(),
            SizedBox(
              height: 20,
            ),
            LocalImage(),
          ],
        )),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(color: Colors.yellow),
      // 图片路径,图片路径必须是图片格式结尾，否则找不到图片报错
      //https://www.itying.com/themes/itying/images/ionic4.png
      // 加载远程图片
      child: Image.network(
        "https://www.itying.com/themes/itying/images/ionic4.png",
        // scale:2 图片缩小一倍
        // alignment 图片在容器中显示的位置
        // alignment: Alignment.centerLeft
        // BoxFit: fill 充满容器,cover 不变形剪裁充满容器，fitHeight 高度填充
        // fit: BoxFit.fitHeight,
        // repeat 平铺
        repeat: ImageRepeat.repeat,
      ),
    ));
  }
}

class Circular extends StatelessWidget {
  const Circular({super.key});

  @override
  Widget build(BuildContext context) {
    // 通过 Container 创建圆形图片
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(75),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.itying.com/themes/itying/images/ionic4.png"),
              fit: BoxFit.cover)),
    );
  }
}

class ClipImage extends StatelessWidget {
  const ClipImage({super.key});

  @override
  Widget build(BuildContext context) {
    // 实现圆形图片ClipOval
    return ClipOval(
      child: Image.network(
        "https://www.itying.com/themes/itying/images/ionic4.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    // 加载本地图片 SizedBox
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 14, 50, 212)),
      child: Image.asset("images/YL3.jpg"),
    );
  }
}
