import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;
  HomePage(this.user); // TabPage로 부터 받은 User

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clon _ys',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      ), // AppBar에 들어갈 내용과 디자인 구성
      body: _buildBody()
    );
  }

 Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0), // 패딩값으로 전체방향 8로 지정
      child: SafeArea( // 아이폰 노치, 갤럭시 알림창 등에 의한 컨텐츠 가림을 막기 위한 Area
          child: SingleChildScrollView( // 디스플레이가 작은 기기의 경우 어플이 잘릴 수도 있으므로 스크롤 추가
            child: Center( // 디자인 요소 중앙에 배열
              child: Column( // 화면 전체구성은 컬럼형
                children: <Widget>[ // Column의 자식은 여러개이므로 children으로 정의
                  Text('윤스타그램에 오신것을 환영합니다.',
                    style: TextStyle(fontSize: 24.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우하세요.'), 
              Padding(padding: EdgeInsets.all(16.0)), // 각 요소들간의 간격을 8~16으로 설정
                  SizedBox( // SizedBox는 위젯을 포함할 수 있는 일종의 Box
                    width: 260.0,
                     // SizedBox의 크기 설정(폭 또는 길이만 고정되도록 설정가능 - 설정안된 부분은 내용에 따라 늘어남)
                    child: Card( // SizedBox에 포함된 위젯
                      elevation: 4.0, // Card의 그림자 깊이 지정
                      child: Padding( // Card 내부 전체의 padding 설정
                        padding: const EdgeInsets.all(8.0),
                        child: Column( // Card에 포함된 위젯, Card 내부는 Column 형태
                          children: <Widget>[
                            SizedBox( // CircleAvatar를 넣기위한 SizedBox
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar( // 네트워크 이미지를 넣기위해 원형 이미지틀 위젯 삽입
                                backgroundImage: NetworkImage(user.photoUrl),
                                // 로그인된 구글 계정의 프로필 이미지를 받아오기 위하여 user.photoUrl 이용
                              ),
                            ),
                            Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                              // 로그인된 계정의 이메일 주소를 받아오기 위하여 user.email 사용
                            Padding(padding: EdgeInsets.all(8.0)),
                            Text(user.displayName),
                              // 로그인된 계정의 이름을 표시하기 위해 user.displayName 사용
                            Padding(padding: EdgeInsets.all(8.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               // 이미지가 중앙에 오도록 정렬
                              children: <Widget>[
                                SizedBox( // 삽입된 이미지가 지정크기에 맞춰지도록 사이즈 제한,
                                  // fit: BoxFit.cover 메소드를 이용하여 이미지 crop
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network('https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/126348204_385375592906927_506130299603221814_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=fij9lqfq02IAX-ZsS5m&tp=1&oh=be07cf413fb87ec481bf43c3dcaa4104&oe=5FEE089F', fit: BoxFit.cover)
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/126348204_385375592906927_506130299603221814_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=fij9lqfq02IAX-ZsS5m&tp=1&oh=be07cf413fb87ec481bf43c3dcaa4104&oe=5FEE089F', fit: BoxFit.cover)
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/126348204_385375592906927_506130299603221814_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=fij9lqfq02IAX-ZsS5m&tp=1&oh=be07cf413fb87ec481bf43c3dcaa4104&oe=5FEE089F', fit: BoxFit.cover)
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(7.0)),
                            Text('Facebook 친구'),
                            Padding(padding: EdgeInsets.all(7.0)),
                            RaisedButton(
                                child: Text('팔로우'),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () {})
                          ],
                        ),
                      ),
                    ),
                  )
            ],
          ),
        ),
      )
      ),
    );
 }
}
