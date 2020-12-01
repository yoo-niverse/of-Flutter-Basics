import 'package:flutter/material.dart';
import 'package:insta_clon/AccountPage.dart';
import 'package:insta_clon/HomePage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0; // 현재 상태(페이지)를 가질 수 있는 변수
  List _pages = [
    HomePage(),
    Text('page2'),
    AccountPage()
  ]; // 버튼별(인덱스별)로 다른 화면을 갖도록 테스트하기 위한 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:_pages[_selectedIndex]),
        // 인덱스값에 따라 리스트에 저장된 요소가 화면에 출력

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black, // 버튼이 선택됐을 때의 색 지정
        currentIndex: _selectedIndex, // 현재 인덱스 값을 저장할 수 있도록 설정
          onTap: _onItemTapped, // 네비게이션 바 버튼이 tap 되었을 때 메소드 호출


        items: <BottomNavigationBarItem>[ // 네비게이션바의 요소(버튼)을 추가하는 코드
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('search')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
      ],),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
