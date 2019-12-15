import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text("Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          Text(
            "View all",
            style: TextStyle(color: Color.fromRGBO(76, 95, 252, 0.85)),
          )
        ]);
  }
}

class Book {
  String name = '';
  String image = '';
  String author = '';

  Book(name, image, author) {
    this.name = name;
    this.image = image;
    this.author = author;
  }
}

var books = [
  Book(
      'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ',
      "https://salt.tikicdn.com/cache/550x550/ts/product/eb/62/6b/0e56b45bddc01b57277484865818ab9b.jpg",
      "Cảnh thiên"),
  Book(
      'Sự kết thúc của thời đại giả kim',
      "https://salt.tikicdn.com/cache/550x550/ts/product/49/70/ff/145b8f5b9bd04c6f19262680f5d58bc5.jpg",
      "Mervyn King"),
  Book(
      'Đời Ngắn Đừng Ngủ Dài',
      "https://salt.tikicdn.com/cache/w1200/ts/product/57/44/86/19de0644beef19b9b885d0942f7d6f25.jpg",
      "Robin Sharma"),
  Book(
      'Trên đường băng',
      "https://salt.tikicdn.com/cache/550x550/ts/product/61/87/8a/082a07cec3232115e2b22636fd71593c.jpg",
      "Tony Buổi sáng"),
  Book(
      'Đàn ông sao hỏa, đàn bà sao kim',
      "https://salt.tikicdn.com/cache/550x550/ts/product/0a/f6/38/bc10734989977da424642a1c4750eee2.jpg",
      "John Gray"),
];

class CarouselBookItem extends StatelessWidget {
  String name = '';
  String image = '';
  String author = '';

  CarouselBookItem(name, image, author) {
    this.name = name;
    this.image = image;
    this.author = author;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              this.image,
              height: 120.0,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              child: Text(
                this.name,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(this.author)
          ],
        ),
      ),
      width: 140,
    ));
  }
}

class BookCarousel extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 220.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: books
              .map((book) =>
                  CarouselBookItem(book.name, book.image, book.author))
              .toList(),
        ));
  }
}

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Title(),
            BookCarousel()
          ],
        ),
      ),
    );
  }
}
