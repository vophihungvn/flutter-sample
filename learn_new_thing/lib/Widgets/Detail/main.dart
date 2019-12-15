import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("named text")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
