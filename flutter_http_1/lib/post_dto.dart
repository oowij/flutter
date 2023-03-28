//post_dto.dart

//테이블 용
class PostDTOTable {
  int userId; //유저 번호
  int id; //글번호
  String title; //제목
  //{}로 감싸면 required가 적혀짐.
  PostDTOTable({required this.userId, required this.id, required this.title});

  //팩토리
  //생성자를 통해서 객체를 만들려고 하는데
  //처리가 번거로울 경우
  //어떠한 타입을 받아서 클래스 내부에서 객체를 생성해서
  //리턴 해주기 위함
  //생성자를 이용한 팩토리 함수
  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
      userId: json["userId"],
      id: json["id"],
      title: json["title"]
  );
  //팩토리 아님
  //팩토리는 타입이 정해져있는데 일반 함수는 타입을 아무거나 해도 됨.
  //instance랑 상관없기 때문에 static으로 해줌
  //팩토리를 이용한 함수
  static List<PostDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
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