import 'package:flutter/material.dart';
// import './Hello.dart';
// import '02_layout/01_Container.dart';
// import '02_layout/02_column_row.dart';
// import '02_layout/03_Flex.dart';
// import '02_layout/04_Wrap.dart';
// import '02_layout/05_Stack.dart';
// import '02_layout/06_Card.dart';
// import '03_button/01_button.dart';
// import '03_button/02_button_theme.dart';
// import '04_image/01_image.dart';
// import '05_list/01_SingleChildScrollview.dart';
// import '05_list/02_listView.dart';
// import '05_list/03_listviewBuilder.dart';
// import '05_list/04_ListViewSeperated.dart';
// import '05_list/05_GridView01.dart';
// import '05_list/05_GridView02.dart';
// import '05_list/06_GridViewCount.dart';
// import '05_list/07_GridViewExtend.dart';
// import '05_list/08_GridViewBuilder.dart';
// import '06_others/01_cupertino.dart';
// import '06_others/02_SafeArea.dart';
// import '07_thirdParty/01_dio.dart';
// import '07_thirdParty/02_swiper.dart';
// import '07_thirdParty/03_shared_preferences.dart';
// import '08_state/01_StatefulWidget.dart';
import '08_state/02_dataTable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1.任务管理器中应用的名称
      title: "Flutter Demo 01",
      // 2.主体内容
      home: const Home(),
      // 3.右上角调试标识
      theme: ThemeData(fontFamily: "Fasthand"),
      debugShowCheckedModeBanner: false,
    );
  }
}
