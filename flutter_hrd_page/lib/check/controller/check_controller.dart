import 'package:flutter/material.dart';

class CheckController extends ChangeNotifier{
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void change(){
    _isChecked =! _isChecked;
    notifyListeners();

  }
}