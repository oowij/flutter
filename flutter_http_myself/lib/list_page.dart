import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_myself/post_dto.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {//HookWidget을 바꿈
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDTOTable>?>(null);
    //실패하면 null이 나오게

    useEffect((){
      String url = "https://jsonplaceholder.typicode.com/users";
      //id,name,email 예시의 json링크를 넣음
      http.get(Uri.parse(url)).then((response){
        if(response.statusCode == 200){//200은 정상응답
          dynamic decodeBody = jsonDecode(response.body);
          List jsonList = decodeBody as List;
          listState.value = jsonList.map((data){
            return PostDTOTable(id: data["id"], name: data["name"], email: data["email"]);
          }).toList();
        }
      });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(postDTOTable: e)).toList() ?? [],
          //children 안에 적어줘야 나옴.
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable;
  
  ListItem({Key? key,required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          Text("유저 번호 ; ${postDTOTable.id}"),
          Divider(),
          Text("유저 이름 ; ${postDTOTable.name}"),
          Divider(),
          Text("유저 이메일 ; ${postDTOTable.email}"),
          Divider(),
        ],
      ),
    );
  }
}

