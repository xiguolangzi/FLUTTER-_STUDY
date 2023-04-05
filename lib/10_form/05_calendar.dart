// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        title: const Text("日历"),
        // 1.3 右侧菜单
        actions: const [Icon(Icons.settings), Icon(Icons.search)],
        // 1.4 标题居中
        centerTitle: true,
      ),
      // 2.应用主体
      body: const CalendarDemo(),
    );
  }
}

class CalendarDemo extends StatefulWidget {
  const CalendarDemo({super.key});

  @override
  State<CalendarDemo> createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CalendarDatePicker(
            // 日期选择样式
            initialCalendarMode: DatePickerMode.day,
            // 初始时间
            initialDate: DateTime.now(),
            // 开始时间
            firstDate: DateTime(2020, 1),
            // 结束时间
            lastDate: DateTime(2023, 12),

            // 选中日期改变时间触发回调函数
            onDateChanged: (dateTime) {
              print("选择的日期是：$dateTime");
            },

            // 月份改变回调函数
            onDisplayedMonthChanged: (value) {
              print("选择的月份是： $value");
            },

            // 日期是否可选（返回 false 标识不可选）
            selectableDayPredicate: (day) {
              if (day == DateTime(2022, 7, 28)) {
                return false;
              }
              return true;
            },
          ),
          CalendarDatePicker(
            // 日期选择样式
            initialCalendarMode: DatePickerMode.year,
            // 初始时间
            initialDate: DateTime.now(),
            // 开始时间
            firstDate: DateTime(2020, 1),
            // 结束时间
            lastDate: DateTime(2023, 12),

            // 选中日期改变时间触发回调函数
            onDateChanged: (dateTime) {
              print("选择的日期是：$dateTime");
            },

            // 月份改变回调函数
            onDisplayedMonthChanged: (value) {
              print("选择的月份是： $value");
            },

            // 日期是否可选（返回 false 标识不可选）
            selectableDayPredicate: (day) {
              if (day == DateTime(2022, 7, 28)) {
                return false;
              }
              return true;
            },
          ),
          ElevatedButton(
              onPressed: () {
                // 是一个方法，不是组件
                showDatePicker(
                  context: context,
                  initialDatePickerMode: DatePickerMode.year,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015, 6),
                  lastDate: DateTime(2025, 6),
                  currentDate: DateTime.now(),
                  // 左上方提示
                  helpText: "年份选择器",
                  // 取消按钮
                  cancelText: "取消",
                  // 确认按钮
                  confirmText: "确认",

                  // 输入格式错误提示
                  errorFormatText: "输入格式错误",
                  // 输入超出时间范围错误提示
                  errorInvalidText: "输入时间超出范围",
                  // 输入时 - 标签文字
                  fieldLabelText: "请输入时间",
                  // 输入时 - 输入为空 - 提示文字
                  fieldHintText: "时间格式 月/日/年",
                );
              },
              child: const Text("showDatePicker 组件")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // 是一个方法，不是组件
                showDatePicker(
                  context: context,
                  initialDatePickerMode: DatePickerMode.day,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015, 6),
                  lastDate: DateTime(2025, 6),

                  // 当前时间
                  currentDate: DateTime.now(),
                  // 左上方提示
                  helpText: "年份选择器",
                  // 取消按钮
                  cancelText: "取消",
                  // 确认按钮
                  confirmText: "确认",

                  // 输入格式错误提示
                  errorFormatText: "输入格式错误",
                  // 输入超出时间范围错误提示
                  errorInvalidText: "输入时间超出范围",
                  // 输入时 - 标签文字
                  fieldLabelText: "请输入时间",
                  // 输入时 - 输入为空 - 提示文字
                  fieldHintText: "时间格式 月/日/年",
                );
              },
              child: const Text("showDatePicker 组件")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
