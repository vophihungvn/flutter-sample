import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text("Favourites",
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
  int rate;

  Book(name, image, author, rate) {
    this.name = name;
    this.image = image;
    this.author = author;
    this.rate = rate;
  }
}

var favouriteBooks = [
  Book(
      'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ',
      "https://salt.tikicdn.com/cache/550x550/ts/product/eb/62/6b/0e56b45bddc01b57277484865818ab9b.jpg",
      "Cảnh thiên",
      2),
  Book(
      'Sự kết thúc của thời đại giả kim',
      "https://salt.tikicdn.com/cache/550x550/ts/product/49/70/ff/145b8f5b9bd04c6f19262680f5d58bc5.jpg",
      "Mervyn King",
      3),
  Book(
      'Đời Ngắn Đừng Ngủ Dài',
      "https://salt.tikicdn.com/cache/w1200/ts/product/57/44/86/19de0644beef19b9b885d0942f7d6f25.jpg",
      "Robin Sharma",
      4),
  Book(
      'Trên đường băng',
      "https://salt.tikicdn.com/cache/550x550/ts/product/61/87/8a/082a07cec3232115e2b22636fd71593c.jpg",
      "Tony Buổi sáng",
      2),
  Book(
      'Đàn ông sao hỏa, đàn bà sao kim',
      "https://salt.tikicdn.com/cache/550x550/ts/product/0a/f6/38/bc10734989977da424642a1c4750eee2.jpg",
      "John Gray",
      5),
];

class CarouselBookItem extends StatelessWidget {
  String name = '';
  String image = '';
  String author = '';
  int rate = 0;

  CarouselBookItem(name, image, author, rate) {
    this.name = name;
    this.image = image;
    this.author = author;
    this.rate = rate;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              this.image,
              height: 110.0,
            ),
            Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 40,
                    child: Text(
                      this.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    this.author,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: Colors.amber,
                      size: 14,
                    ),
                    child: StarDisplay(value: this.rate),
                  ),
                ],
              ),
              width: 140,
            )
          ],
        ),
      ),
      width: 280,
    ));
  }
}

class BookCarousel extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 130.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: favouriteBooks
              .map((book) => CarouselBookItem(
                  book.name, book.image, book.author, book.rate))
              .toList(),
        ));
  }
}

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0, 16, 0),
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
