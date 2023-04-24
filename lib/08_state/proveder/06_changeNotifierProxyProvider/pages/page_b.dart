import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_manager_model.dart';
import 'package:ufo/12_log/02_log.dart';

import '../widgets/book_item.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookcount = bookManagerModel.length;

    var log = MyselfPrinter.logger(PageB);
    log.i("调用 PageB ----------");
    log.i("序列ID个数 == $bookcount");

    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏"),
      ),
      body: ListView.builder(
        itemCount: bookcount,
        itemBuilder: (context, id) =>
            BookItem(id: bookManagerModel.getByPosition(id).bookId),
      ),
    );
  }
}
