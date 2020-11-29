import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 Ui'),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text('쿠퍼티노 버튼'),
         ),
          CupertinoSwitch(value: true, onChanged: null)
        ],
      ),
    );
   }
}


