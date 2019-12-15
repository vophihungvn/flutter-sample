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

class Heading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.arrow_back),
        RaisedButton(
          onPressed: () {
            print("Press button");
          },
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: Text("Order now"),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            // side: BorderSide(color: Colors.red)
          ),
        )
      ],
    );
  }
}

class MainDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Image.network(
            "https://salt.tikicdn.com/cache/550x550/ts/product/eb/62/6b/0e56b45bddc01b57277484865818ab9b.jpg",
            height: 160.0,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  child: Text(
                    "Đừng Lựa Chọn An Nhàn Khi Còn Trẻ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text("Cảnh thiên"),
                SizedBox(
                  height: 12.0,
                ),
                IconTheme(
                  data: IconThemeData(
                    color: Colors.amber,
                    size: 16,
                  ),
                  child: StarDisplay(value: 3),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ClipRRect(
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: Text(
                          "Sci-Fi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Heading(),
                  SizedBox(
                    height: 12.0,
                  ),
                  MainDetail(),
                  SizedBox(
                    height: 12.0,
                  ),
                  Divider(
                    height: 12.0,
                    thickness: 2.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
