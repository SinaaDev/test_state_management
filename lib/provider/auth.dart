import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier{



  void signIn({required String email, required String password})async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', true);
    notifyListeners();
  }

  void logout ()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

}