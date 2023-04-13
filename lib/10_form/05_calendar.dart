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
  // 1.声明时间返回值
  DateTime _date = DateTime.now();
  TimeOfDay _times = TimeOfDay.now();
  String _apm =
      TimeOfDay.now().period.toString() == "DayPeriod.am" ? "上午" : "下午";
  String _showTimes = TimeOfDay.now().period.toString() == "DayPeriod.am"
      ? "上午 - "
      : "下午 - ${TimeOfDay.now().toString().substring(10, 15)}";

  // 2.1 获取时间返回值 - 方式一
  _showDatepickeDayInput() async {
    // 异步函数
    showDatePicker(
      // 日历基础设置
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 6),
      lastDate: DateTime(2025, 6),
      currentDate: DateTime.now(),

      // 弹出模式 - 日历模式
      initialEntryMode: DatePickerEntryMode.input,

      // 日历文字
      helpText: "年份选择器",
      cancelText: "取消",
      confirmText: "确认",

      // 日历提示信息
      errorFormatText: "输入格式错误",
      errorInvalidText: "输入时间超出范围",
      fieldLabelText: "请输入时间",
      fieldHintText: "时间格式 月/日/年",

      // 异步函数返回值
    ).then((value) {
      setState(() {
        // 日历取消返回 null 处理
        if (value != null) {
          _date = value;
        }
      });
    });
  }

  //  2.2 获取时间返回值 - 方式二
  _showDatePickerCalendar() async {
    var _picker = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 6),
      lastDate: DateTime(2025, 6),

      // 弹出模式 - 日历模式
      initialEntryMode: DatePickerEntryMode.calendar,

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

    setState(() {
      if (_picker != null) {
        _date = _picker;
      }
    });
  }

  _showTimePickerInput() async {
    showTimePicker(
      context: context,
      // initialTime: TimeOfDay.now(),
      initialTime: const TimeOfDay(hour: 10, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      helpText: "时间选择器",
      confirmText: "确定",
      cancelText: "取消",
      hourLabelText: "小时",
      minuteLabelText: "分钟",
      errorInvalidText: "错误输入提示",
    ).then((value) {
      setState(() {
        if (value != null) {
          _times = value;
          _apm = _times.period.toString() == "DayPeriod.am" ? "上午" : "下午";
          print(_times.period.toString());
        }
        _showTimes = _apm + _times.toString().substring(10, 15);
      });
    });
  }

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
                _showDatePickerCalendar();
              },
              child: const Text(
                "showDatePicker 组件 -弹出模式 日历calendar - 路径",
                // 处理中文错字问题
                // locale: Locale("zh", "CN"),
              )),
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

                  // 弹出模式 - 日历模式
                  initialEntryMode: DatePickerEntryMode.calendarOnly,

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
              child: const Text(
                "showDatePicker 组件 -弹出模式 calendarOnly - 路径",
                // 处理中文错字问题
                locale: Locale("zh", "CN"),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _showDatepickeDayInput();
              },
              child: const Text(
                "showDatePicker 组件 -弹出模式 输入 Input - 路径",
                // 处理中文错字问题
                locale: Locale("zh", "CN"),
              )),
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

                  // 弹出模式 - 日历模式
                  initialEntryMode: DatePickerEntryMode.inputOnly,

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
              child: const Text(
                "showDatePicker 组件 -弹出模式 inputOnly - 路径",
                // 处理中文错字问题
                locale: Locale("zh", "CN"),
              )),
          const SizedBox(
            child: Text("############## 获取时间打印 ##############"),
          ),
          SizedBox(
            child: Text(
              "当前选择的时间是： $_date",
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          const SizedBox(
            child: Text("##############     时钟     ##############"),
          ),
          SizedBox(
            child: Text("当前的时间是：$_showTimes"),
          ),
          ElevatedButton(
              onPressed: () {
                _showTimePickerInput();
              },
              child: const Text("showtimepicker - input")),
          const SizedBox(
            child: Text("##############     IOS 风格     ##############"),
          ),
          const SizedBox(
            child: Text(" 时-分  hm  "),
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: const Duration(hours: 5, minutes: 10),
            minuteInterval: 10,
            secondInterval: 10,
            alignment: Alignment.center,
            backgroundColor: Colors.blue[100],
            onTimerDurationChanged: (datTime) {
              print("选中时间: $datTime");
            },
          ),
          const SizedBox(
            child: Text(" 分-秒  ms  "),
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: const Duration(minutes: 10, seconds: 30),
            minuteInterval: 10,
            secondInterval: 10,
            alignment: Alignment.center,
            backgroundColor: Colors.blue[100],
            onTimerDurationChanged: (datTime) {
              print("选中时间: $datTime");
            },
          ),
          const SizedBox(
            child: Text(" 时-分-秒  hms  "),
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            initialTimerDuration:
                const Duration(hours: 5, minutes: 10, seconds: 30),
            minuteInterval: 10,
            secondInterval: 10,
            alignment: Alignment.center,
            backgroundColor: Colors.blue[100],
            onTimerDurationChanged: (datTime) {
              print("选中时间: $datTime");
            },
          ),
        ],
      ),
    );
  }
}
