
import 'dart:async';

class CounterController{
  final _couterStreamController = StreamController<int>();

  Stream<int> get counterStream => _couterStreamController.stream;

  void addCount(int newCount){
    _couterStreamController.sink.add(newCount);
  }
}