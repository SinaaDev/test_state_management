import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_state_management_2/provider/auth.dart';
import 'package:task_state_management_2/screens/movie_list_screen.dart';
import 'package:task_state_management_2/screens/sign_in_screen.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  Future<String> getUserName()async{
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    return email ?? 'Unkown';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getUserName(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 18),);
                  }
                  return const SizedBox.shrink();
                },
            ),
            const Gap(12),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MovieListScreen(),));
            }, child: const Text('ENTER MOVIE LIST')),
            const Gap(12),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MovieListScreen(),));
            }, child: const Text('ENTER COLOR PICKER')),
          ],
        ),
      ),
    );
  }
}
