import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main(){
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}
// useState - 상태저장
// useEffect - 화면이 빌드 된 후 작동해야 할 것들을 작성
// useRef - 상태관리는 필요없는데 데이터는 유지 되어야 하는 것들 저장
class CounterPage extends HookWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "${counter.value}",
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
