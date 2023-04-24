import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';
import 'package:ufo/12_log/02_log.dart';

import 'book_button.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);
    var book = bookModel.getById(id);

    var log = MyselfPrinter.logger(BookItem);
    log.i("调用 BookItem -> 序列id == $id");

    return ListTile(
      // 头部
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      // 标题
      title: Text(
        book.bookName,
        style: const TextStyle(color: Colors.black87),
      ),
      // 尾部
      trailing: BookButton(book: book),
    );
  }
}
