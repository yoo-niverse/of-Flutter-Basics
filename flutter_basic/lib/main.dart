import 'package:flutter/material.dart';

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
      home: Scaffold( // Scaffold 속성의 추가를 통해 AppBar, Title 등의 형식 지정가능
          appBar: AppBar( // 최상단 타이틀이 노출되는 부분. 하위 title 메소드의 내용이 표시됨
            title : Text('title in AppBar'),
          ),
          body: Text('헬로월드')) // 흰 배경 본문 부분
    );
  }
}

