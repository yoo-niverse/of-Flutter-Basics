import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Yoonstagram Clon', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(50.0)),

            SignInButton(Buttons.GoogleDark, onPressed: () {})
            // signin_button 라이브러리 이용하여 구글 로그인 버튼 구현

          ],
        ),
    ),
    );
  }
}


