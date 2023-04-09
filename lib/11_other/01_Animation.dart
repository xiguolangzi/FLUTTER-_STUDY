// ignore: file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("动画"),
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        centerTitle: true,
      ),
      body: const AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    // 1.引入混入，为了使vsync后面使用当前状态组件对象_AnimationDemoState
    with
        SingleTickerProviderStateMixin {
  // 2.定义参数
  late AnimationController controller;
  // 3.定义 具体的动画
  late Animation animation;

  // 4.初始化动画
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 4.1 创建 AnimationController 动画控制器 lowerbound upperbound 范围0.0-1.0
    controller = AnimationController(
        // 4.1.1 当前状态组件对象 this代表当前类
        vsync: this,
        duration: const Duration(
          // 4.1.2 动画时间
          milliseconds: 400,
        ));

    // 4.2 声明动画曲线
    animation = CurvedAnimation(
      // 为动画控制器声明动画曲线
      parent: controller,
      // 选择动画曲线
      curve: Curves.bounceIn,
    );

    // 4.3 设置动画值得范围
    // animation 的值默认 0.0 - 1.0
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);

    // 4.3 监听动画
    animation.addListener(() {
      // 打印一下当前动画的值
      print("打印当前动画值:$animation.value");
      setState(() {});
    });

    // 4.4 默认执行动画 - 正向执行动画
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // 5.0 执行动画 - 正向
                controller.forward();
              },
              child: const Text("放大")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // 5.2 执行动画 - 反向
                controller.reverse();
              },
              child: const Text("缩小")),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                // 5.3 监听动画状态
                animation.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    // 如果状态为结束 则执行反向动画
                    controller.reverse();
                  } else if (status == AnimationStatus.dismissed) {
                    // 如果状态为开始 则执行正向动画
                    controller.forward();
                  }
                  // 开始正向动画
                  // controller.forward();
                });
                // 启动动画
                controller.forward();
              },
              child: const Text("重复")),
          ElevatedButton(
              onPressed: () {
                // 5.4 停止动画
                controller.stop();
              },
              child: const Text("停止")),
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 50,
          ),

          // 6.1 动画取值采用 animation ，可以通过tween()设置范围
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: animation.value,
          ),
          // 6.2 动画取值采用 controller，取值范围是0.0-1.0
          // 透明度
          Opacity(
            // 透明度取值
            opacity: controller.value,
            child: const Text(
              "hello world",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  // 7. 最后释放动画资源 - 必须写
  @override
  void dispose() {
    // TODO: implement dispose
    print("释放动画资源");
    super.dispose();
    controller.dispose();
  }
}
