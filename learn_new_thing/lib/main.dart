import 'package:flutter/material.dart';
import 'package:learn_new_thing/Widgets/Head/main.dart';
import 'package:learn_new_thing/Widgets/Popular/main.dart';
import 'package:learn_new_thing/Widgets/Favourite/main.dart';
import 'package:learn_new_thing/Widgets/Reading/main.dart';
import 'package:learn_new_thing/Widgets/Detail/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/detail': (context) => Detail(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                children: <Widget>[Head(), Popular(), Favourite(), Reading()],
              )
            ],
          ),
        ),
      ),
    );
  }
}
