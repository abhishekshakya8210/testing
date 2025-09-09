import 'package:flutter/widgets.dart';

class Selectprovider with ChangeNotifier{
  bool isselected = true;
  int count = 50;
  void setvalue(){
    count=50+count;
    isselected= !isselected;
    
    notifyListeners();

  }
}