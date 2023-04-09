// ignore: file_names
import 'package:flutter/material.dart';

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
  AnimationController controller;
  // 2.定义动画 1
  Animation animation;
  // 2.定义动画 2
  Animation sizeAnimation;
  // 2.定义动画 3
  Animation colorAnimation;
  // 2.定义动画 4
  Animation rotationAnimation;

  // 3.初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 4.创建控制器
    controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1000,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
