import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:flutter_http_1/post/model/repository/post_repository.dart';

class DetailPage extends HookWidget {

  final int postId;

  const DetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailState = useState<PostDTODetail?>(null);
    //통신
    useEffect((){
      PostRepository.instance.getDTO(postId).then((value){
        detailState.value = value;
      });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: detailState.value != null ? Column(
          children: [
            Text("유저번호 : ${detailState.value!.userId}"),
            Text("글번호 ${detailState.value!.id}"),
            Text("제목 ${detailState.value!.title}"),
            Text("내용 ${detailState.value!.body}"),
          ],
        ) : Text("값이 없습니다."),
      ),
    );
  }
}
