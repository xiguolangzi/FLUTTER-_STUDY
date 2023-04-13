import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLocalizations {
  // 1.设置参数
  final Locale locale;
  // 2.创建构造函数
  CustomLocalizations(this.locale);
  // 3.声明 Map类型 的翻译信息
  static final Map<String, Map<String, String>> _localiztedValue = {
    "en": {"首页": "Home!", "文本-多语言": "text_language"},
    "zh": {"首页": "首页", "文本-多语言": "文本-多语言"},
    "es": {"首页": "Hora!", "文本-多语言": "Hora e idioma"}
  };

  // 4. 声明翻译方法
  String? t(String key) {
    // _localiztedValue["zh"]["首页"]
    return _localiztedValue[locale.languageCode]![key];
  }

  // 7. 封装调用
  static setLanguage(context, key) {
    return Localizations.of(context, CustomLocalizations).t(key);
  }

  // 6. 声明代理
  static CustomLocaliztionsDelegate delegate = CustomLocaliztionsDelegate();
}

// 5. 本地化类 的 代理
class CustomLocaliztionsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  // 5.1 继承 抽象类 实现 抽象方法
  @override
  bool isSupported(Locale locale) {
    // 5.1.1 判断本地语言代码 是不是 包含在 []内，判断包含[].contains(value)
    return ["en", "zh", "es"].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) {
    // 5.1.2 因为内容少，将异步转化成同步 SynchronousFuture
    return SynchronousFuture(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    // 5.1.3 不希望频繁更新，所以选择false
    return false;
  }
}
