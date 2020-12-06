import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clon/TabPage.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Yoonstagram Clon', style: TextStyle(fontSize: 40.0,
                fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(50.0)),

            SignInButton(Buttons.GoogleDark,
              onPressed: () {
              _handleSignIn().then((user) {
                print(user);
                // 로그인 버튼을 눌렀을 때 _handleSignIn 메소드 호출
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TabPage(user)));
                // await 대신 비동기화 하기위해 then 메소드 사용

              });
              },
            ),
            // signin_button 라이브러리 이용하여 구글 로그인 버튼 구현

          ],
        ),
     ),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    // _handleSignIn 메소드를 비동기 함수로 만들기 위해 Future형 반환, async 설정
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken)
    );
  }
}


