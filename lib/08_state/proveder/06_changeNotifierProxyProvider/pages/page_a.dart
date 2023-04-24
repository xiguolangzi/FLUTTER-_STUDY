import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';
import 'package:ufo/12_log/02_log.dart';

import '../widgets/book_item.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);
    var log = MyselfPrinter.logger(PageA);
    log.i("书籍列表 -$bookModel有 ${bookModel.lenth} 个book");

    return Scaffold(
        appBar: AppBar(
          title: const Text("书籍列表"),
        ),
        body: ListView.builder(
          // id 从0-7
          itemBuilder: (context, id) => BookItem(id: id),
          itemCount: bookModel.lenth,
        ));
  }
}
