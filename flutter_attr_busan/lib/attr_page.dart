import 'package:flutter/material.dart';
import 'package:flutter_attr_busan/attr_dto.dart';
import 'package:flutter_attr_busan/attr_item.dart';
import 'package:flutter_attr_busan/attr_repository.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//상태구성할때 hook으로 변경
class AttrPage extends HookWidget{
  const AttrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<AttrDTO>>([]);//리스트는 괜찮음.
    useEffect((){
      AttrRepository.getDTO().then((value){
        // if(value != null){//null처리를 안하면 오류남
        //   listState.value = value;
        // }
        // 또 다른 방법
        listState.value = value ?? [];
      });
    },[]);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value.map((e) => AttrItem(attrDTO: e)).toList(),
        ),
      ),
    );
  }
}
