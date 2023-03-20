import 'package:flutter/material.dart';

// 프로그램 실행을 위해 main이 필요함.
void main() {
  // 플러터는 프레임워크 -> 제어의 역전 (IOC)
  // 앱을 실행시켜줘 (개발자가 프레임워크에 요청)
  // 매개변수는 Widget
  // const는 컴파일 시점에 데이터 고정
  // 바뀌지 않는 화면일 경우만 사용
  // 필요하지 않은 화면에는 무조건 const 붙이기
  // 데이터를 주입하는 위젯에는 const 미사용
  runApp(const MyApp2());
}

// 위젯
// 화면을 그리는 단위
// 위젯 클래스를 사용하면 build 메서드가 실행된다.
// html의 태그와 같은 역할
// StatelessWidget은 고정된 화면을 만든다.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp 안드로이드 스타일 앱 제작 위젯
    //
    return MaterialApp(
      // title : 앱의 제목
      title: "MyApp",
      // theme : 앱의 색상, 글꼴 / ThemeData 객체
      // debug ~ : 디버그 모드 배너 여부
      debugShowCheckedModeBanner: false,
      // routes 생략
      // locale : 앱의 언어를 사용하는 언어에 맞게 설정 할 수 있다.
      // home : 앱 실행시 표시되는 위젯
      home: Scaffold(
        // Scaffold 바닥
        // 앱 구조의 기반을 만드는 위젯
        // appBar : 제목, 뒤로가기, 햄버거버튼 등
        appBar: AppBar(
          title: Text("MyApp"),
        ),
        // drawer : 서랍, 사이드 메뉴 등
        drawer: Drawer(),
        // bottomNavigationBar : 화면 이동 네비게이션
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: "add",
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "remove",
              icon: Icon(Icons.remove),
            )
          ],
        ),
        // floatingActionButton : 화면 위에 떠 있는 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: SafeArea(
          // 폰 기종마다 다른 노치, 알림바 등을 피해서
          // 화면을 노출한다.
          // Scaffold - SafeArea 조합은 기본적으로 사용
          child: Center(
            child: Text("안녕"),
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  // State안의 변수는 관찰된다.
  // 변수의 값이 바뀌면 화면이 바뀐다.
  // int count = 0;

  int navIndex = 0;

  void changeNavIndex(int index){
    setState(() {
      navIndex = index;
    });
  }

  List _items = [
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  // void increaseCount() {
  //   // Stateful 변수를 변경할 때에는
  //   // 무조건 setState 함수를 사용한다.
  //   setState(() {
  //     count++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navIndex,
          // onTap: changeNavIndex,
          onTap: (index) => changeNavIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: "노랑",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: "초록",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: "파랑",
            ),
          ],
        ),
        body: SafeArea(child: _items[navIndex]),
      ),
    );
  }
}
