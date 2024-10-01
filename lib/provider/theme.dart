import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier{

  Color pickerColor = const Color(0xFF000000);

  void onColorChanged(Color color){
    pickerColor = color;
    notifyListeners();
  }

}