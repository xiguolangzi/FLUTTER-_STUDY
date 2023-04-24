import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_manager_model.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';
import 'package:ufo/12_log/02_log.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);

    var log = MyselfPrinter.logger(BookButton);
    log.i(
        "调用BookButton -> bookid == ${book.bookId} , bookname == ${book.bookName}");

    // 手势检测器 GestureDetector
    return GestureDetector(
      // 点击 判断 bookManagerModel 中 books 是否包含 book
      onTap: bookManagerModel.books.contains(book)
          // 如果已包含，则删除 bookManagerModel 中的 bookIds 中 book.bookId
          ? () => bookManagerModel.removeFaves(book)
          // 如果未包含，则增加 bookManagerModel 中的 bookIds 中 book.bookId
          : () => bookManagerModel.addFaves(book),
      child: SizedBox(
        width: 100,
        height: 60,
        // 判断 bookManagerModel 中 books 是否包含 book
        child: bookManagerModel.books.contains(book)
            // 判断后不同的展示
            ? const Icon(
                Icons.star,
                color: Colors.red,
              )
            : const Icon(Icons.star_border),
      ),
    );
  }
}
