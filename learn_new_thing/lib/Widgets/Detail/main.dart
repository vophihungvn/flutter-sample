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
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
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

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Text(
          "Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
            "Mơ mộng rằng khởi nghiệp xong sẽ lập tức nhận được tiền đầu tư, cầm được tiền đầu tư là sẽ niêm yết trên sàn chứng khoán. Mơ mộng rằng muốn gì sẽ có đó, không thiếu tiền cũng chẳng thiếu tình, an hưởng những năm tháng êm đềm trong cuộc đời mình. Nhưng vì sao bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ."),
        SizedBox(
          height: 16,
        ),
        Text(
          "See more -----",
          style: TextStyle(color: Color.fromRGBO(76, 95, 252, 0.85)),
        )
      ],
    );
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text("Comments (12)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
              Text(
                "View all",
                style: TextStyle(color: Color.fromRGBO(76, 95, 252, 0.85)),
              )
            ]),
        SizedBox(
          height: 24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i-giaitri.vnecdn.net/2018/03/01/shakira-7528-1519881179.jpg')),
              width: 60.0,
              height: 60.0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Shakira Isabel Mebarak Ripoll",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("Singer"),
                    Text("Dec 14"),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "This is really a great book, I want to read another one like this, please recommend me!!")
                  ],
                ),
              ),
            )
          ],
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
          padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
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
                    thickness: 1.0,
                  ),
                  DescriptionSection(),
                  SizedBox(
                    height: 16,
                  ),
                  Comment()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
