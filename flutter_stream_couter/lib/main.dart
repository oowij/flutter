import 'package:flutter/material.dart';
import 'package:flutter_stream_counter/counter_controller.dart';

import 'counter_controller.dart';

void main() {
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

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterController = new CounterController();
    return StreamBuilder<int>(
        stream: counterController.counterStream,
        builder: (context, snapshot) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                var nowCount = snapshot.data ?? 0;
                counterController.addCount(nowCount + 1);
              },
            ),
            body: SafeArea(
              child: Center(
                child: Text(
                  "${snapshot.data ?? "0"}",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          );
        }
    );
  }
}