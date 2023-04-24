class Book {
  int bookId;
  String bookName;
  Book(this.bookId, this.bookName);
}

class BookModel {
  static final _books = [
    Book(1, "斗罗大陆"),
    Book(2, "斗破苍穹"),
    Book(3, "完美世界"),
    Book(4, "灵剑尊"),
    Book(5, "火影忍者"),
    Book(6, "灌篮高手"),
    Book(7, "西游记"),
    Book(8, "三国演义"),
  ];

  // 获取书籍长度
  int get lenth => _books.length;

  // 根据 ID 获取书籍
  Book getById(int id) => _books[id - 1];

  // 根据索引获取数据
  Book getByPosition(int position) => _books[position];

  // 更多 ....
}
