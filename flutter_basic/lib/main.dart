
import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() {
  runApp(MyApp());
} // main 함수 -> MyApp 이라는 클래스를 실행함

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application

        primarySwatch: Colors.deepOrange, // 앱의 전체적인 테마 색상 지정
      ),
      home: HelloPage('Hello Wor32d'));
        //HelloPage('Hello Wor32d'));

  }
}

class HelloPage extends StatefulWidget { // 상태를 가질 수 있는 클래스
  final String title;
  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello Wor1d';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: _changeMessage),
        appBar: AppBar(
      title: Text(widget.title)
    ), body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message, style: TextStyle(fontSize: 30)),
            Text('$_counter', style: TextStyle(fontSize: 30)),
            RaisedButton(
              child: Text('화면 이동'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CupertinoPage())
              );
             },
            )
          ]
        )
    ));
  }

  void _changeMessage() {
    setState(() {
      _message = '헬로 월드';
      _counter += 1;
    });
  }
}

