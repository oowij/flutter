import 'package:flutter/foundation.dart';
import 'package:flutter_http_1/post/model/repository/post_repository.dart';
//foundation은 flutter를 구성하는 기초문법들
import '../model/dto/post_dto.dart';

class PostTableController extends ChangeNotifier {
  List<PostDTOTable>? _postDTOTableList;

  List<PostDTOTable>? get postDTOTableList => _postDTOTableList;

  void setPostDTOTableList(){
    PostRepository.instance.getDTOList().then((value){
      _postDTOTableList = value;
      notifyListeners();
    });
  }
}
