import 'package:flutter/foundation.dart';

class Faviroteprovider with ChangeNotifier{
  List<int> isselected = [];
  void itemselect(int value){
      isselected.add(value);
      notifyListeners();
  }

  
}