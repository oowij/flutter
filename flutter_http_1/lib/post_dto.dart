//post_dto.dart

//테이블 용
class PostDTOTable {
  int userId; //유저 번호
  int id; //글번호
  String title; //제목
  //{}로 감싸면 required가 적혀짐.
  PostDTOTable({required this.userId, required this.id, required this.title});
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