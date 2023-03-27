import 'package:flutter/material.dart';
import 'package:flutter_http_myself/list_page.dart';

void main(){
  runApp(MyApp());
  //실행할 수 있게 runApp을 해줌.
}

//StatelessWidget으로 한다
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
    );
  }
}
