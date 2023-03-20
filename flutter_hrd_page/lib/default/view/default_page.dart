import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hrd_page/check/controller/check_controller.dart';
import 'package:flutter_hrd_page/check/view/check_page.dart';
import 'package:flutter_hrd_page/default/widgets/default_first_item.dart';
import 'package:flutter_hrd_page/default/widgets/default_second_item.dart';
import 'package:provider/provider.dart';

//페이지 내부의 상태를 관리하기 위해
//hookWidget
//사용할 수 있는 hook
//useEffect 등이 있다.
//hook은 build 함수 안에 적는다.
class DefaultPage extends HookWidget {
  DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkController = context.watch<CheckController>();
    List widgetItems = [//const를 지워줘야함
          () => DefaultFirstItem(checkController.isChecked),
          () => DefaultSecondItem(),
    ];
    final navIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        //첫번째 방법(나의 정보 글씨가 다른 텍스트가 들어오면 밀림)
        title: Center(child: Text("나의 정보")),
        // 2번째 방법(밀리지 않음)
        // title: Text("나의 정보"),
        // centerTitle: true,
        actions: [
          InkWell(//어떤 위젯을 클릴할 수 있게 함.
            onTap: (){
              Navigator.push/*뒤로가기 버튼이 생성됨*//*pushReplacement는 뒤로가기가 없음*/(
                context,
                MaterialPageRoute(builder: (context) => CheckPage())
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              //all은 하나만, only는 상하좌우, 시메트릭?상하 or 좌우
              child: Icon(Icons.move_to_inbox),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int idx){
          navIndex.value = idx;
        },
        currentIndex: navIndex.value,//items를 꼭 넣어줘야함
        items: [//최소 2개 이상 넣어줘야함 아니면 오류
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "나의 정보"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "다른 정보"
          ),
        ],
      ),
      body: SafeArea(
        child: widgetItems[navIndex.value](),//값에 따라 출력화면이 달라짐.
        //화면에 있는 내용을 바꿀때 지역상태로 바꾼다.
      ),
    );
  }
}
