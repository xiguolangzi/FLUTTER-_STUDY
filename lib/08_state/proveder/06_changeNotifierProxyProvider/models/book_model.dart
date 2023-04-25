class Book {
  int bookId;
  String bookName;
  Book(this.bookId, this.bookName);
}

class BookModel {
  static final _books = [
    Book(0, "斗罗大陆"),
    Book(1, "斗破苍穹"),
    Book(2, "完美世界"),
    Book(3, "灵剑尊"),
    Book(4, "火影忍者"),
    Book(5, "灌篮高手"),
    Book(6, "西游记"),
    Book(7, "三国演义"),
  ];

  // 获取书籍长度
  int get lenth => _books.length;

  // 根据 ID 获取书籍
  Book getById(int id) => _books[id];

  // 根据索引获取数据
  Book getByPosition(int position) => _books[position];

  // 更多 ....
}
