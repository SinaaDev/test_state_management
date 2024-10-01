import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_state_management_2/provider/auth.dart';
import 'package:task_state_management_2/provider/movie.dart';
import 'package:task_state_management_2/screens/favorite_list.dart';
import 'package:task_state_management_2/screens/movie_list_screen.dart';
import 'package:task_state_management_2/screens/sign_in_screen.dart';
import 'package:task_state_management_2/screens/user_info_screen.dart';
import 'package:task_state_management_2/utils/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final  isLoggedIn = prefs.getBool('isLoggedIn') ?? false ;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth(),),
        ChangeNotifierProvider(create: (context) => Movie(),)
      ],
      child:  MyApp(isLoggedIn: isLoggedIn,),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: isLoggedIn? const MovieListScreen() : const SignInScreen(),
    );
  }
}
