import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: null,
      child: Icon(Icons.create),
        backgroundColor: Colors.lightBlue,
      ),

      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 그리드 내부 열의 개수 - 3개
          childAspectRatio: 1.0, // 그리드 내부 요소의 가로세로 비율(정사각형 1:1)
          mainAxisSpacing: 5.0, // 요소들간의 가로 간격 조정
          crossAxisSpacing: 6.0 // 요소들간의 세로 간격 조정
        ),
        itemCount: 6, // 그리드에 표시될 item 개수
        itemBuilder: (context, index) {
          return _buildListItem(context, index); // 그리드 내용을 받는 메소드
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'https://bit.ly/2JsEkgP', fit: BoxFit.cover);
    // 내용(이미지)와 순서를 변수로 받아 return
  }
}

