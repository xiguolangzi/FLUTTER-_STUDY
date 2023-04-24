import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';

import '../widgets/book_item.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("书籍列表"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => BookItem(id: index + 1),
          itemCount: bookModel.lenth,
        ));
  }
}
