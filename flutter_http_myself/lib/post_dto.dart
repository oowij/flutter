import 'dart:convert';

class PostDTOTable{
  //id, name, email의 타입을 지정해 생성자 만들어 줌
  int id;
  String name;
  String email;

  PostDTOTable({required this.id, required this.name, required this.email});

  //팩토리
  //생성자를 통해서 객체를 만들려고 하는데
  //처리가 번거로울 경우
  //어떠한 타입을 받아서 클래스 내부에서 객체를 생성해서
  //리턴 해주기 위함
  //생성자를 이용한 팩토리 함수
  factory PostDTOTable.fromjson(dynamic json) => PostDTOTable(
      id: json["id"],
      name: json["name"],
      email: json["email"]
  );
  //팩토리 아님
  //팩토리는 타입이 정해져있는데 일반 함수는 타입을 아무거나 해도 됨.
  //instance랑 상관없기 때문에 static으로 해줌
  //팩토리를 이용한 함수
  static List<PostDTOTable> fromJsonList(List jsonList){
    return jsonList.map((e) => PostDTOTable.fromjson(json)).toList();
  }
}
//상세 페이지 용
class PostDTODetail {
  int userId;
  int id;
  String title;
  String body;

  PostDTODetail(
      {required this.userId,
        required this.id,
        required this.title,
        required this.body});
}