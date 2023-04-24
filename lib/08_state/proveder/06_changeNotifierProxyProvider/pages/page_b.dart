import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_manager_model.dart';

import '../widgets/book_item.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookcount = bookManagerModel.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏"),
      ),
      body: ListView.builder(
        itemCount: bookcount,
        itemBuilder: (context, index) =>
            BookItem(id: bookManagerModel.getByPosition(index).bookId),
      ),
    );
  }
}
