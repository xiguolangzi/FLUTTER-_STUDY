import 'package:flutter/material.dart';
// 国际化语言导包 flutter_localizations
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/01_changeNotifierProveder/user_model1.dart';
import '08_state/proveder/04_multiProvider/user_model4.dart';
import '12_log/02_log.dart';

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
// import '09_navigation/04_arguments.dart';
// import '09_navigation/05_drawer.dart';
// import '09_navigation/06_BottomNavigatorBar.dart';
// import '09_navigation/07_tab.dart';
// import '10_form/01_switch.dart';
// import '10_form/02_checkBox.dart';
// import '10_form/03_radio.dart';
// import '10_form/04_TextField.dart';
// import '10_form/05_calendar.dart';
// import '10_form/06_form.dart';
// import '10_form/07_form2.dart';
// import '11_other/01_Animation.dart';
// import '11_other/02_staggerAnimation.dart';
// import '11_other/03_heroAnimation.dart';
// import '10_form/05_calendar.dart';
// import '11_other/04_texti18n.dart';
// import '11_other/CustomLocalizations.dart';
// import '11_other/05_text_language_page.dart';
import '11_other/CustomLocalizationsActive.dart';
// import '13_theme/01_theme.dart';
// import '08_state/proveder/01_changeNotifierProveder/changeNotifierProvider.dart';
// import '08_state/proveder/01_changeNotifierProveder/user_model1.dart';
// import '08_state/proveder/02_futureProvider/future_provider.dart';
// import '08_state/proveder/03_streamProvider/stream_provider.dart';
import '08_state/proveder/04_multiProvider/multi_provider.dart';
// 引入自定义主题
import '13_theme/CustomTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var log = MyselfPrinter.logger(MyApp);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1.任务管理器中应用的名称
      title: "Flutter Demo 01",
      // 2.主体内容
      // home: const Home(),

      // 8. proveder 跨组件状态管理
      // // 8.1. ChangeNotifierProvider  - 提供者1 - 调用构造模型 UserModel1
      // home: ChangeNotifierProvider<UserModel1>(
      //   create: (context) => UserModel1(),
      //   child: const Home(),
      // ),

      // // 8.2. FutureProvider - 异步提供者 - 默认取初始值，只能更新一次
      // home: FutureProvider<UserModel2>(
      //   create: (context) => UserFuture().asyncGetUserModel2(),
      //   initialData: UserModel2(name: "hello"),
      //   child: const Home(),
      // ),

      // // 8.3. StreamProvider -流提供者 - 默认初始值
      // home: StreamProvider<UserModel3>(
      //   create: (context) => UserStream().getStreamUserModel(),
      //   initialData: UserModel3(name: "hello"),
      //   child: const Home(),
      // ),

      // 8.4.
      home: MultiProvider(
        // 队列里放置多个模型，必须是继承 changeNotifier
        providers: [
          ChangeNotifierProvider<UserModel1>(create: (context) => UserModel1()),
          ChangeNotifierProvider<UserModel4>(create: (context) => UserModel4()),
        ],
        child: const Home(),
      ),

      // 3.右上角调试标识
      debugShowCheckedModeBanner: false,

      // 8.主题
      // theme: ThemeData(
      //   // 8.1 appBar 主题
      //   appBarTheme: AppBarTheme(
      //       backgroundColor: Colors.red[400],
      //       titleTextStyle: const TextStyle(fontSize: 30, color: Colors.black),
      //       iconTheme: IconThemeData(
      //         size: 30,
      //         color: Colors.blueAccent[100],
      //       )),
      //   // 8.2控制导航颜色
      //   primaryColor: Colors.green[200],
      //   // 8.3只对老按钮生效，新按钮不生效
      //   buttonTheme: ButtonThemeData(
      //       buttonColor: Colors.amber[800],
      //       textTheme: ButtonTextTheme.primary,
      //       splashColor: Colors.green),
      //   // 8.4字体
      //   fontFamily: "Fasthand",
      //   textTheme: TextTheme(
      //       titleLarge: TextStyle(
      //         fontSize: 50,
      //         color: Colors.cyan[600],
      //       ),
      //       titleMedium: const TextStyle(
      //         fontSize: 50,
      //         color: Color.fromARGB(255, 6, 236, 140),
      //       ),
      //       titleSmall: const TextStyle(
      //         fontSize: 20,
      //         color: Color.fromARGB(255, 206, 30, 112),
      //       ),
      //       bodyLarge: TextStyle(
      //         fontSize: 50,
      //         color: Colors.cyan[600],
      //       ),
      //       bodyMedium: const TextStyle(
      //         fontSize: 50,
      //         color: Color.fromARGB(255, 6, 236, 140),
      //       ),
      //       bodySmall: const TextStyle(
      //         fontSize: 20,
      //         color: Color.fromARGB(255, 206, 30, 112),
      //       )),
      //   // 8.5 icon 主题
      //   iconTheme: const IconThemeData(size: 50, color: Colors.red),
      //   // 8.6 card 主题
      //   cardTheme: CardTheme(
      //     margin: const EdgeInsets.all(30),
      //     color: Colors.grey[300],
      //     // 阴影颜色
      //     shadowColor: Colors.blue,
      //     // 阴影高度
      //     elevation: 10,
      //     // 边框
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20),
      //         side: const BorderSide(color: Colors.grey, width: 1)),
      //   ),
      // ),

      // 9. 主题风格 - 浅色主题/深色主题
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),

      // 10. 主题风格 - 浅色主题/深色主题 - 自定义
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,

      // // 4.1 命名路由 - 声明路由
      // routes: {
      //   "home": (context) => const Home(),
      //   "product": (context) => const Product(),
      //   "productDetail": (context) => const ProductDetail(),
      // },
      // // 4.2 命名路由 - 默认路由
      // initialRoute: "home",
      // // 4.3 命名路由 - 配置未知路由
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => const UnkoownPage()),

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

      // 6. 国际化
      // 6.1. 本地化代理
      localizationsDelegates: [
        // 本地化代理 - android
        GlobalMaterialLocalizations.delegate,
        // 本地化代理 - Widgets
        GlobalWidgetsLocalizations.delegate,
        // 本地化代理 - IOS
        GlobalCupertinoLocalizations.delegate,

        // 本地化代理 - 文本 - 自定义
        // CustomLocalizations.delegate,
        CustomLocalizationsActive.delegate
      ],

      // 6.2. 设置支持的语言
      supportedLocales: const [
        Locale("en", "US"),
        Locale("zh", "CN"),
        Locale("es", "ES")
      ],

      // 7.检测当前语言
      localeResolutionCallback: (locale, supportedLocales) {
        // 7.1 打印当前语言环境 locale
        print("deviceLocale -- $locale");
        print("languageCode -- ${locale!.languageCode}");
        print("language -- ${locale.countryCode}");

        log.v("Verbose log");
        log.d("DeBug log");
        log.i("Info log");
        log.w("Warning log");
        log.e("Error log");
        log.wtf("what a terriable failure log");

        // 7.2 检查设置的语言环境supportedLocales 是否匹配 当前的语言环境locale
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            // 7.3 如果有匹配的,则返回设置的语言
            return supportedLocale;
          }
        }
        // 7.4 如果没有匹配,则返回设置的语言的第一种语言
        return supportedLocales.first;
      },
    );
  }
}
