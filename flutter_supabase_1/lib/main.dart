import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{// future async await 는 무조건 함께
  await Supabase.initialize(//runApp을 실행하기 전에 먼저 작성해줘야 함
    url: "https://jhcvljjxxepwhzrlkida.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpoY3Zsamp4eGVwd2h6cmxraWRhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA1NzIyNTksImV4cCI6MTk5NjE0ODI1OX0.UJsTBmISHAGWbmRqusHFkMt2VlXhjPQStdt8GgX7fZo"
  );//로그인 된 상태
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //연결되는 상태
    // Supabase.instance.client.from("todo").select().then((value){
    //   print(value);
    // });
    //리스트를 받는 타입
    Supabase.instance.client.from("todo").stream(primaryKey: ["idx"]).listen((event) {
      print(event);
    });
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Map<String, dynamic>>>(//event에 커서 올려서 복붙(그림으로 설명함)
            //stream에는 위에 복붙해서 가져옴.
            stream: Supabase.instance.client.from("todo").stream(primaryKey: ["idx"]),
            builder: (context, snapshot) {
              return ListView(//리스트뷰가 데이터를 뿌리기 때문에 stream을 받아줘야함
                children: snapshot.data?.map((e) => Text(e["content"])).toList() ?? [],
              );
            }
          ),
        ),
      ),
    );
  }
}
