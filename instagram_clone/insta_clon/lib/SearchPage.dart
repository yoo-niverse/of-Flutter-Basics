import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clon/CreatePage.dart';
import 'package:insta_clon/DetailPostPage.dart';

class SearchPage extends StatefulWidget {

  final FirebaseUser user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
          },

        child: Icon(Icons.create),
        backgroundColor: Colors.lightBlue,
      ),

      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
          // post 아래 데이터에 변화가 생기면 새로운 데이터가 들어옴
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) { // 데이터가 없다면
            return Center(child: CircularProgressIndicator());
            // 로딩바가 출력되도록 설정
          }

          var items = snapshot.data?.documents ?? [];
          // collections에 있는 문서들이 documents로 들어옴
          // documents가 null이라면 빈 리스트로 초기화

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 그리드 내부 열의 개수 - 3개
                  childAspectRatio: 1.0, // 그리드 내부 요소의 가로세로 비율(정사각형 1:1)
                  mainAxisSpacing: 5.0, // 요소들간의 가로 간격 조정
                  crossAxisSpacing: 6.0 // 요소들간의 세로 간격 조정
              ),
              itemCount: items.length, // 그리드에 표시될 item 개수
              itemBuilder: (context, index) {
                return _buildListItem(context, items[index]); // 그리드 내용을 받는 메소드
              });
        },
      );
  }

  Widget _buildListItem(context, document) {
    return Hero( // 사진 터치 시 확대/축소 효과용 위젯
      tag: document['photoUrl'],
      child: Material(
        child: InkWell( // 썸네일 이미지 터치 시 물방울이 퍼지는 효과주는 위젯
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document); // 터치한 경우 DetailPostPage로 이동
            }));
          },
          child: Image.network(
              document['photoUrl'], // 리스트에 저장된 이미지의 key값 얻을 수 있음
              fit: BoxFit.cover),
        ),
      ),
    );
    // 내용(이미지)와 순서를 변수로 받아 return
  }
}

