import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_manager_model.dart';
import 'package:ufo/08_state/proveder/06_changeNotifierProxyProvider/models/book_model.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    return GestureDetector(
      onTap: bookManagerModel.books.contains(book)
          ? () => bookManagerModel.removeFaves(book)
          : () => bookManagerModel.addFaves(book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: bookManagerModel.books.contains(book)
            ? const Icon(
                Icons.star,
                color: Colors.red,
              )
            : const Icon(Icons.star_border),
      ),
    );
  }
}
