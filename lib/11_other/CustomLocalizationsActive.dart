// json 解析库 - 转换库 convert
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLocalizationsActive {
  // 1.设置参数
  final Locale locale;
  // 2.创建构造函数
  CustomLocalizationsActive(this.locale);
  // 3.声明 Map类型 的翻译信息
  // static final Map<String, Map<String, String>> _localiztedValue = {
  //   "en": {"首页": "Home!", "文本-多语言": "text_language"},
  //   "zh": {"首页": "首页", "文本-多语言": "文本-多语言"},
  //   "es": {"首页": "Hora!", "文本-多语言": "Hora e idioma"}
  // };
  late Map<String, String> _localiztedValue;

  // 3.1 给 _localiztedValue 赋值 - 异步
  Future<bool> loadJson() async {
    // 3.1.1 rootBundle 根目录资源包的加载
    String jsonString = await rootBundle
        .loadString("language_page/${locale.languageCode}.json");
    // 3.1.2 json 解析
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    // 3.1.3 解析后的 json 赋值 - 通过.map((key, value){ return MapEntry(key,value)}) 赋值
    _localiztedValue = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    // 3.1.4 返回bool类型
    return true;
  }

  // 4. 声明翻译方法
  String? t(String key) {
    // _localiztedValue["zh"]["首页"]
    // return _localiztedValue[locale.languageCode]![key];
    return _localiztedValue[key];
  }

  // 7. 封装调用
  static setLanguage(context, key) {
    return Localizations.of(context, CustomLocalizationsActive).t(key);
  }

  // 6. 声明代理
  static CustomLocaliztionsDelegate delegate = CustomLocaliztionsDelegate();
}

// 5. 本地化类 的 代理
class CustomLocaliztionsDelegate
    extends LocalizationsDelegate<CustomLocalizationsActive> {
  // 5.1 继承 抽象类 实现 抽象方法
  @override
  bool isSupported(Locale locale) {
    // 5.1.1 判断本地语言代码 是不是 包含在 []内，判断包含[].contains(value)
    return ["en", "zh", "es"].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizationsActive> load(Locale locale) async {
    // 5.1.2 因为内容少，将异步转化成同步 SynchronousFuture
    // return SynchronousFuture(CustomLocalizationsActive(locale));
    // 5.1.4 实例化
    CustomLocalizationsActive localizationsActive =
        CustomLocalizationsActive(locale);
    // 5.1.5 异步调用方法 - 给 实例化的属性 _localiztedValue 赋值
    await localizationsActive.loadJson();
    // 5.1.6 返回实例化 - 属性
    return localizationsActive;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<CustomLocalizationsActive> old) {
    // 5.1.3 不希望频繁更新，所以选择false
    return false;
  }
}
