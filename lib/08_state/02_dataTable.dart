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
        title: const Text("数据列表"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const DataTableDemo(),
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

class User {
  String name;
  int age;
  bool selected;
  // 实例化类
  User(this.name, this.age, {this.selected = false});
}

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  // user类型
  List<User> data = [
    User("张三", 18),
    User("张三丰", 218, selected: true),
    User("张无忌", 60),
    User("张翠山balbalabaa", 30)
  ];

  var _sortAscending = true;

  List<DataRow> _getUserRows() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < data.length; i++) {
      bool sel = data[i].selected;
      dataRows.add(DataRow(
          selected: sel,
          onSelectChanged: (value) {
            setState(() {
              data[i].selected = value!;
            });
          },
          cells: [
            DataCell(Text(data[i].name)),
            DataCell(Text("${data[i].age}")),
            const DataCell(Text("男")),
            const DataCell(Text("----"))
          ]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        // 指定行高
        // dataRowHeight: 10,
        // 水平外边距
        // horizontalMargin: 20,
        // 列间距
        // columnSpacing: 20,
        // 按第几列排序
        sortColumnIndex: 1,
        // 升序还是降序
        sortAscending: _sortAscending,
        columns: [
          const DataColumn(label: Text("姓名")),
          DataColumn(
              label: const Text("年龄"),
              // 数字型，可排序
              numeric: true,
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortAscending = ascending;
                  if (ascending) {
                    // sort 比较函数
                    data.sort((a, b) => a.age.compareTo(b.age));
                  } else {
                    data.sort((a, b) => b.age.compareTo(a.age));
                  }
                });
              }),
          const DataColumn(label: Text("性别")),
          const DataColumn(label: Text("简介"))
        ],
        rows: _getUserRows(),
        // const [
        //   DataRow(cells: [
        //     DataCell(Text("张三")),
        //     DataCell(Text("18")),
        //     DataCell(Text("男")),
        //     DataCell(Text("老张家老三"))
        //   ]),
        //   DataRow(cells: [
        //     DataCell(Text("张三")),
        //     DataCell(Text("18")),
        //     DataCell(Text("男")),
        //     DataCell(Text("老张家老三"))
        //   ]),
        //   DataRow(cells: [
        //     DataCell(Text("张三")),
        //     DataCell(Text("18")),
        //     DataCell(Text("男")),
        //     DataCell(Text("老张家老三"))
        //   ]),
        //   DataRow(cells: [
        //     DataCell(Text("张三")),
        //     DataCell(Text("18")),
        //     DataCell(Text("男")),
        //     DataCell(Text("老张家老三"))
        //   ])
        // ]
      ),
    );
  }
}
