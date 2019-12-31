import 'package:flutter/material.dart';
import 'package:qr_reader/Widgets/AppDrawer.dart';
import 'package:calendar_strip/calendar_strip.dart';

class CalendarSection extends StatefulWidget {
  @override
  _CalendarSectionState createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(monthName,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarStrip(
        // startDate: startDate,
        // endDate: endDate,
        onDateSelected: onSelect,
        dateTileBuilder: dateTileBuilder,
        iconColor: Colors.black87,
        monthNameWidget: _monthNameWidget,
        markedDates: markedDates,
        containerDecoration: BoxDecoration(color: Colors.white24),
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Training part 1",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.black45,
                  size: 14,
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text("Main room",
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Colors.black45,
                          size: 14,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Dec 26, 2019",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.av_timer,
                          color: Colors.black54,
                          size: 14,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("09:00 - 17:30",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54))
                      ],
                    ),
                  ],
                ),
                Column(children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            right: 40.0,
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage: NetworkImage(
                                  "https://i.ytimg.com/vi/pRpeEdMmmQ0/maxresdefault.jpg"),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage: NetworkImage(
                                  "https://s.yimg.com/ny/api/res/1.2/yAqTbRZ2ix4Q5.gkyelfdQ--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/https://media.zenfs.com/en-US/theblast_73/8c437737b22abfe3ad9f882ddfefdd70"),
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            child: Text("+5"),
                          ),
                        ],
                      ),
                    ],
                  )
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Section"),
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: <Widget>[
              CalendarSection(),
              SizedBox(
                height: 12,
              ),
              SectionItem(),
              SectionItem(),
              SectionItem(),
              SectionItem(),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
