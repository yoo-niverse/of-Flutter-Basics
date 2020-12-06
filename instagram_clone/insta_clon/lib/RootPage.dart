import 'package:flutter/material.dart';
import 'package:insta_clon/LoginPage.dart';
import 'package:insta_clon/TabPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

// RootPage는 이동할 화면만 결정, 상태가 변하지 않는 페이지
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      // StreamBuilder : 데이터의 흐름을 이용하여 데이터가 변경됐을 때
      // 통지를 받아 그것에 대한 반응을 하도록 코드 작성 가능
        stream: FirebaseAuth.instance.onAuthStateChanged,
          // 로그인 상태가 변화되면 그에 따라 동작 재처리 하도록 설정

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) { // 로그인의 성공(실패) 여부 파악
            // 로그인 성공 시 : snapshot 부분에 로그인 정보 가지고 있음
            return TabPage(snapshot.data);
          } // 로그인된 경우 snapshot의 데이터를 전달하며 TabPage로 이동
          
          else {
            return LoginPage();
          } // 로그인 되지 않은 경우 LoginPage로 이동
        });
  }
}

