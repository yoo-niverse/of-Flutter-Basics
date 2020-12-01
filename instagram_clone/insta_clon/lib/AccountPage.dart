import 'package:flutter/material.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(), // 이와 같이 appBar와 Body를 메소드로 호출할 수 있음
    );
  }
  Widget _buildAppBar() { // AppBar 코드가 길어지는 것을 방지하기 위한 메소드
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app), // 로그아웃 버튼 생성
          onPressed: () {},
        )
      ],
    );
  }

 Widget _buildBody() { // Body 코드가 길어지는 것을 방지하기 위한 대체 메소드
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // 게시물, 팔로워 등이 상단에 노출될 수 있도록 정렬
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 상단 row 각 요소들이 적당한 간격을 두고 띄워지도록 정렬
          children: <Widget>[
            Column( // 프로필 사진, 플로팅 버튼, 이름을 담기위한 컬럼
              children: <Widget>[
                Stack( // 프로필 사진 위에 플로팅 버튼을 올리기 위해 Stack 사용
                  children: <Widget>[
                    SizedBox( // 프로필 사진을 정해진 크기의 원에 넣을 수 있도록 설정
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://bit.ly/2JsEkgP')
                      ),
                    ),
                    Container( // 플로팅 아이콘을 자유롭게 정렬하기 위해 Container에 담음
                      width: 80.0,
                      height: 80.0, // Avatar의 사이즈와 동일하게 하여 동일하게 정렬되는 효과 줄 수 있음
                      alignment: Alignment.bottomRight, // 플로팅 버튼을 사진 오른쪽 하단으로 정렬
                      child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: FloatingActionButton(onPressed: null,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.add),),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('최윤성',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
              ],
            ),
            Text('0\n게시물', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
            Text('0\n팔로워', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
            Text('0\n팔로잉', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          ],
        ),
    );
 }
}
