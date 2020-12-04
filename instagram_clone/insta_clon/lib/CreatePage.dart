import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController(); // 텍스트 컨트롤러를 사용하기위한 선언

  File _image; // 불러온 파일을 _image 형으로 저장

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose(); // 메모리를 해제해주기 위한 메소드
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
          // 플로팅 버튼을 불렀을 때 사진을 선택하는 기능 : _getImage 메소드로 구현
          child: Icon(Icons.add_a_photo)),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.send), onPressed: () {},)
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView( // 이미지 업로드 후 글 작성 공간이 키패드 크기에 따라
      // 자동으로 스크롤 업 될 수 있도록 ScrollView 이용
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image),
          // _image가 null일 경우 No Image 출력 / 아닐 경우 이미지 파일 출력
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),// 텍스트를 입력받을 수 있는 필드
           controller: textEditingController
        )
      ],
      ),
    );
  }

  Future<void> _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // pickImage는 Future 형의 데이터를 return 하는 메소드
    // 따라서 _image = image 형태의 대입은 불가능
    // _getImage를 비동기 메소드로 설정하면 ImagePicker 작업이 완료된 후 대입되도록 설정가능

    setState(() {
      _image = image;
    }); // 이미지가 선택되면 UI가 변경되어야 하므로 (No Image -> 선택된 이미지) setState 사용
  }
}

