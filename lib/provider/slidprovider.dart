import 'package:flutter/material.dart';

class Slidprovider with ChangeNotifier {
  double val = 0.1;

  void updateVal(double newVal) {
    val = newVal;
    notifyListeners();
  }
}
