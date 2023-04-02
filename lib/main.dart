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
// import '08_state/02_dataTable.dart';
// import '08_state/03_inheritedWidget.dart';
// import '08_state/04_provider.dart';
// import '08_state/05_lifecycle.dart';
// import '09_navigation/01_anonymous.dart';
// import '09_navigation/02_namedRoute.dart';
// import '09_navigation/03_onGenerateRoute.dart';
import '09_navigation/04_arguments.dart';

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
      // home: const Home(),

      // 3.右上角调试标识
      theme: ThemeData(fontFamily: "Fasthand"),
      debugShowCheckedModeBanner: false,

      // 4.1 命名路由 - 声明路由
      routes: {
        "home": (context) => Home(),
        "product": (context) => const Product(),
      },
      // 4.2 命名路由 - 默认路由
      initialRoute: "home",
      // 4.3 命名路由 - 配置未知路由
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const UnkoownPage()),

      // // 5.1 动态路由 - 声明路由
      // onGenerateRoute: (settings) {
      //   // 5.2 打印路径
      //   print("当前路径：" + settings.name.toString());
      //   // 5.3 匹配路径，默认"/"
      //   if (settings.name == "/") {
      //     return MaterialPageRoute(builder: (context) => const Home());
      //   }
      //   if (settings.name == "/product") {
      //     return MaterialPageRoute(builder: (context) => const Product());
      //   }

      //   // 匹配 /product/id 的路由
      //   // 解析路径
      //   var uri = Uri.parse(settings.name.toString());
      //   // 解析后的结果是一个数组 [product,2]
      //   print(uri.pathSegments);
      //   if (uri.pathSegments.length == 2 &&
      //       uri.pathSegments.first == "product") {
      //     var id = uri.pathSegments[1];
      //     return MaterialPageRoute(builder: (context) => ProductDetail(id: id));
      //   }
      //   return MaterialPageRoute(builder: (context) => const UnkoownPage());
      // },
    );
  }
}
