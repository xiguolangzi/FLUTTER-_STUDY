// ignore: file_names
import 'package:flutter/material.dart';

import 'pages/page_a.dart';
import 'pages/page_b.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;
  final _pages = [const PageA(), const PageB()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // 浮动按钮 结合scaffold使用
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "书籍列表"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏"),
        ],
      ),
    );
  }
}
