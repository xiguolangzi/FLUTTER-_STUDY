import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';

import 'book_button.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);
    var book = bookModel.getById(id);

    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text(
        book.bookName,
        style: const TextStyle(color: Colors.black87),
      ),
      trailing: BookButton(book: book),
    );
  }
}
