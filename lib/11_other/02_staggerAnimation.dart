// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("交织动画"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const StaggerAnimationDemo(),
    );
  }
}

class StaggerAnimationDemo extends StatefulWidget {
  const StaggerAnimationDemo({super.key});

  @override
  State<StaggerAnimationDemo> createState() => _StaggerAnimationDemoState();
}

class _StaggerAnimationDemoState extends State<StaggerAnimationDemo>
    with SingleTickerProviderStateMixin {
  // 1.定义动画控制器
  late AnimationController controller;
  // 2.定义动画
  late Animation<double> animation;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotationAnimation;

  // 3.初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 4.创建控制器
    controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 3000,
        ));

    // 5.创建动画
    animation = CurvedAnimation(
        parent: controller,
        // 开始动画部分 0.0 - 0.5 动画曲线默认 Curves.linear
        curve: const Interval(0.0, 0.5, curve: Curves.linear));

    // 6.监听动画 animation
    animation.addListener(() {
      setState(() {});
    });

    // 7.让动画反复运行 animation
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    // 8.设置动画值
    // 尺寸 Tween
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation);
    // 颜色 ColorTween
    colorAnimation = ColorTween(begin: Colors.amber[50], end: Colors.red)
        .animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.5, 0.8)))
      ..addListener(() {
        setState(() {});
      });
    // 旋转圈数 Tween
    rotationAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1, curve: Curves.easeIn)));
    rotationAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                controller.forward();
              },
              child: const Text("重复")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                controller.stop();
              },
              child: const Text("停止")),
          const SizedBox(
            height: 50,
          ),
          // 9. 引用动画值
          Opacity(
            // 透明度 0.0 - 1.0
            opacity: controller.value,
            // 矩阵函数
            child: Transform.rotate(
              // 角度
              angle: rotationAnimation.value,
              child: Container(
                alignment: Alignment.center,
                width: sizeAnimation.value,
                height: sizeAnimation.value,
                color: colorAnimation.value,
                child: const Text(
                  "hello",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 10. 最后释放动画资源 - 必须写
  @override
  void dispose() {
    // TODO: implement dispose
    print("释放动画资源");
    super.dispose();
    controller.dispose();
  }
}
