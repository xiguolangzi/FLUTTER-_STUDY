// ignore: file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1.应用头部
      appBar: AppBar(
        // 1.1 左侧菜单
        leading: const Icon(Icons.menu),
        // 1.2 头部标题
        title: const Text("Drawer"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const HomePage(),
      // 3.不适用PC端
      drawer: const DrawerList(),
      endDrawer: const DrawerList(),

      // 浮动按钮 结合scaffold使用
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Increment",
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("home"),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding 为了让背景图覆盖状态栏
        padding: const EdgeInsets.all(0),
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("初六"),
            accountEmail: Text("hubiao19910129@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.0x/0.jpg"), fit: BoxFit.cover)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/2.0x/1.jpg"),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // 添加分割线
          const Divider(
            thickness: 2,
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("回退"),
            // 点击导航
            onTap: () => Navigator.pop(context),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          AboutListTile(
            // 应用名称
            applicationName: "应用名称",
            // 版本号
            applicationVersion: "1.0.0",
            // 头像
            icon: const CircleAvatar(
              child: Text("aaaa"),
            ),
            // 法律条例
            applicationLegalese: "应用法律条例",
            aboutBoxChildren: const [
              Text("条例一：阿收款单据阿锦爱上了看见的拉上课了家里加"),
              Text("条例二：阿收款单据阿锦爱上了看见的拉上课了家里加")
            ],
            // 头像2
            applicationIcon: Image.asset(
              "images/2.0x/0.jpg",
              width: 50,
              height: 50,
            ),
            // table
            child: const Text("关于"),
          )
        ],
      ),
    );
  }
}
