import 'package:flutter/material.dart';

class Logicincreamentprovider with ChangeNotifier {
  int isselected = -1; 

  void setSelected(int index) {
    isselected = index;
    notifyListeners(); 
  }
}
